class SiteMemosController < ApplicationController
  def index(site_id:)
    @site = Site.find(site_id)
    @construction_materials = @site.construction_materials
  end

  def new_step1(site_id:)

  end

  def form_switcher
    
  end
end
