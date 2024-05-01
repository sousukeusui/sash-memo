class SitesController < ApplicationController
  def index
    @sites = current_user.sites.eager_load(:contractor, :site_memos).page(params[:page]).per(5)
  end

  def new
    @contractors = current_user.contractors
  end

  def destroy(id:)
    @site = Site.find(id)
    @site.destroy
    # flash.now.notice = '現場を削除しました'
  end

  def search_contractor(contractor:)
    # contractorをひらがな、カタカナ、ローマ字に変換するメソッドを用意する
    contractors = current_user.contractors.suggest_name(name: contractor)
    respond_to do |format|
      format.json { render json: contractors }
    end
  end

  def create(contractor_name:, name:, address:, research_date:, research_start_time:, construction_date:, construction_start_time:)
    #find_or_createにする予定
    contractor = Contractor.find_or_create_by(name: contractor_name) do |contractor|
      contractor.user_id = current_user.id
    end
    site = Site.new(name: name,
                    address: address,
                    research_date: research_date,
                    research_start_time: research_start_time,
                    construction_date: construction_date,
                    construction_start_time: construction_start_time,
                    user_id: current_user.id,
                    contractor_id: contractor.id
                    )
    if site.save!
      redirect_to sites_index_path, notice: '現場を作成しました'
    else
      redirect_to sites_new_path, alert: site.errors.full_messages
    end
  end
end
