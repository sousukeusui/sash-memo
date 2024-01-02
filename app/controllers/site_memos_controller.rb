class SiteMemosController < ApplicationController
  def index(site_id:)
    @site = Site.find(site_id)
    @site_memos = @site.site_memos
  end

  def bulk_order(site_id:)
    site = Site.find(site_id)
    #一括で発注済みにするメソッド
    site.site_memos.each { |site_memo| site_memo.update_order }
    redirect_to site_memos_index_path(site_id), notice: '全て発注済みにしました'
  end

  def new_step1(site_id:)
    @site_id = site_id
  end

  def show_switcher(kind:, id:)
    redirect_to inner_sashes_show_path(id) if kind == 'inner_sash' 
    #他のモデルが追加されたら分岐を追加
  end

  def form_switcher(kind:, site_id:)
    case kind
    when 'inner_sash'
      redirect_to inner_sashes_new_step2_path(site_id)
    end
  end
end
