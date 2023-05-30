class SiteMemosController < ApplicationController
  def index(site_id:)
    @site = Site.find(site_id)
    @site_memos = @site.site_memos
  end

  def new_step1(site_id:)
    session[:site_id] = site_id #セッションに保存させるようにする
  end

  def form_switcher(kind:)
    case kind
    when 'inner_sash'
      redirect_to site_memos_inner_sash_new_step2_path
    end
  end

  def inner_sash_new_step2
    
  end
end
