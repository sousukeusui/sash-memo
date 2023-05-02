class SiteMemosController < ApplicationController
  def index(id:)
    @site = Site.find(id)
    @site_memos = @site.site_memos
  end

  def new_step1(id:)
  end
end
