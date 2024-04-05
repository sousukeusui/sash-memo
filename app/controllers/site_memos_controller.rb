class SiteMemosController < ApplicationController
  def index(site_id:)
    @site = Site.find(site_id)
    #site_memoの全ての子モデル結合して取得
    #site_memosに新しい子モデルができたらそれに応じて取得するものを動的に変える    
    @site = Site.preload(site_memos: :inner_sash).find(site_id)
    @site_memos = @site.site_memos.page(params[:page]).per(5)
    @order_key = get_order_key(site_memos: @site.site_memos)
  end

  def update_bulk_order(site_id:,order:)
    site = Site.find(site_id)
    #一括で発注済みにするメソッド
    site.site_memos.update_all(order: order)
    redirect_to site_memos_index_path(site_id), notice: "全て#{ SiteMemo.orders_i18n[order.to_sym]}にしました"
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

  def destroy(id:)
    @site_memo = SiteMemo.find(id)
    @site_memo.destroy
    # flash.now.notice = 'メモを削除しました'
  end

  private

  def get_order_key(site_memos:)
    orders = site_memos.pluck(:order)
    return "unordered" if orders.all?{ |order| order == "ordered" }
    return "ordered"
  end
end
