class SitesController < ApplicationController
  permits :id, :name, :address, :research_date, :research_start_time, :construction_date,
          :construction_start_time, contractor_attributes: [:name]

  def index
    @sites = current_user.sites.preload(:contractor, site_memos: :inner_sashes).page(params[:page]).per(5)
  end

  def new
    @site = Site.new
    @contractor = @site.build_contractor
  end

  def destroy(id:)
    @site = Site.find(id)
    @site.destroy
    # flash.now.notice = '現場を削除しました'
  end

  def search_contractor(contractor:)
    contractors = current_user.contractors.suggest_name(name: contractor)
    respond_to do |format|
      format.json { render json: contractors }
    end
  end

  def create(site)
    Site.create_with_contractor_or_find(site: site.merge(user_id: current_user.id))
    redirect_to sites_index_path, notice: '現場を作成しました'
  rescue => e
    redirect_to sites_new_path, alert: e
  end
end
