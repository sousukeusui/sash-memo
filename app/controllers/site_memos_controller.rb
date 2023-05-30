class SiteMemosController < ApplicationController
  def index(site_id:)
    @site = Site.find(site_id)
    @construction_materials = @site.construction_materials
  end

  def new_step1(site_id:)
    session[:site_id] = site_id #セッションに保存させるようにする
  end

  def form_switcher(kind:)
    site_memo = SiteMemo.new(
      kind: kind
      site_id: session[:site_id]
    )
    if site_memo.valid?
      case kind
      when 'inner_sash'
        redirect_to site_memos_inner_sash_new_step2_path
      end
    else
      redirect_to site_memos_new_step1_path, notice: site_memo.errors.full_messages
    end
  end

  def inner_sash_new_step2
    
  end
end
