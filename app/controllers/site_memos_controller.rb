class SiteMemosController < ApplicationController
  def index(site_id:)
    @site = Site.find(site_id)
    @construction_materials = @site.construction_materials
  end
end
