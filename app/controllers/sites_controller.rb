class SitesController < ApplicationController
  def index
  end

  def new

  end

  def create(contractor_name:, name:, address:, research_date:, research_start_time:, construction_date:, construction_start_time:)
    contractor = Contractor.create!(name: contractor_name, user_id: current_user.id)
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
