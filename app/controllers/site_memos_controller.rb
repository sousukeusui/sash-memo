class SiteMemosController < ApplicationController
  permits :kind

  def index(site_id:)
    #site_memoの全ての子モデル結合して取得
    #site_memosに新しい子モデルができたらそれに応じて取得するものを動的に変える    
    @site = Site.preload(site_memos: :inner_sashes).find(site_id)
    @site_memos = @site.site_memos.page(params[:page]).per(5)
    @order_key = get_opposite_order_key(site_memos: @site.site_memos)
  end

  def update_bulk_order(site_id:,order:)
    @site = Site.find(site_id)
    @site.site_memos.update_all(order: order)
    @site_memos = @site.site_memos.page(params[:page]).per(5)
    @order_key = get_opposite_order_key(site_memos: @site_memos)
    flash.now.notice = "全て#{ SiteMemo.orders_i18n[order.to_sym]}にしました"
  end

  def new_step1(site_id:)
    session[:site_id] = site_id
    @site_memo = SiteMemo.new
  end

  def form_switcher(site_memo)
    kind = site_memo[:kind]
    site_id = session[:site_id]
    
    return redirect_to site_memos_new_step1_path(site_id), alert: "施工内容を選択してください" if kind.blank?

    exist_sm = SiteMemo.eager_load(:site).find_by(site_id: site_id, kind: kind)
    return redirect_to "/#{kind.pluralize}/new_step2" if exist_sm.blank?
    
    kind = exist_sm.kind.to_s.pluralize
    status = exist_sm.status

    return redirect_to "/#{kind}/new_#{status}" if exist_sm && status !='published'
    return redirect_to "/#{kind}/new_step2"
  end

  def show_switcher(kind:, id:)
    redirect_to inner_sashes_show_path(id) if kind == 'inner_sash' 
    #他のモデルが追加されたら分岐を追加
  end

  def destroy(id:)
    @site_memo = SiteMemo.find(id)
    @site_memo.destroy
    flash.now.notice = 'メモを削除しました'
  end
end
