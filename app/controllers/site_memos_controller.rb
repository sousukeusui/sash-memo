class SiteMemosController < ApplicationController
  def index(site_id:)
    @site = Site.find(site_id)
    @site_memos = @site.site_memos
    @order_key = get_reverse_order_info(site_memos: @site_memos)
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

  def get_reverse_order_info(site_memos:)
    #未発注が含まれていれば「発注済み（ordered)」を返し、発注済みが含まれていれば「未発注（unordered)」を返す
    return 'ordered' if site_memos.any? { |site_memo| site_memo.include_unordered? == true }
    return 'unordered'
  end
end
