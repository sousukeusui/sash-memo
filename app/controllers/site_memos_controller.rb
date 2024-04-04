class SiteMemosController < ApplicationController
  def index(site_id:)
    @site = Site.find(site_id)
    #site_memoの全ての子モデル結合して取得
    @site = Site.preload(site_memos: :inner_sash).find(site_id)
    @site_memos = @site.site_memos.page(params[:page]).per(5)
    @order_key = get_order_info(site_memos: @site.site_memos)
  end

  def update_bulk_order(site_id:,order:)
    site = Site.find(site_id)
    order_key = get_reverse_order_info(site_memos: site.site_memos)
    #一括で発注済みにするメソッド
    site.site_memos.each { |site_memo| site_memo.update_order(order: order) }
    redirect_to site_memos_index_path(site_id), notice: "全て#{ InnerSash.orders_i18n[order_key.to_sym]}にしました"
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

  private

  def get_order_info(site_memos:)
    orders = site_memos.pluck(:order)
    return "unorder" if orders.all?{ |order| order == "ordered" }
    return "ordered"
  end
end
