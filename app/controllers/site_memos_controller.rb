class SiteMemosController < ApplicationController
  permits :kind

  def index(site_id:)
    #site_memosに新しい子モデルができたらそれに応じて取得するものを動的に変える    
    @site = Site.preload(site_memos: :inner_sashes).find(site_id)
    #あとでページネーションを考える
    @site_memos = @site.site_memos
    @order_key = get_opposite_order_key(site_memos: @site_memos)
  end

  def update_bulk_order(site_id:, order:, devise:)
    @site = Site.preload(site_memos: :inner_sashes).find(site_id)
    @site_memos = @site.site_memos
    update_childs_order(site_memos: @site_memos, order: order)
    # あとでページネーション考える
    @order_key = get_opposite_order_key(site_memos: @site_memos)
    flash.now.notice = "全て#{ InnerSash.orders_i18n[order.to_sym]}にしました"
    respond_to do |format|
      format.turbo_stream { render "update_bulk_#{devise}_order" }
    end
  end

  def new_step1(site_id:)
    session[:site_id] = site_id
    @site = Site.find(site_id)
    @site_memo = SiteMemo.new
  end

  def form_switcher(site_memo)
    kind = site_memo[:kind]
    site_id = session[:site_id]

    @site_memo = SiteMemo.new(site_id: site_id, kind: kind)
    ex_sash_memo = SiteMemo.find_by(site_id: site_id, kind: kind)

    if ex_sash_memo.blank? && @site_memo.save
      return redirect_to "/#{kind.pluralize}/new_step2"
    elsif ex_sash_memo.blank?
      return render 'new_step1', status: :unprocessable_entity
    end
    
    kind = ex_sash_memo.kind.to_s.pluralize
    status = ex_sash_memo.status

    return redirect_to "/#{kind}/new_#{status}" if ex_sash_memo && status !='comfirmation'
    return redirect_to "/#{kind}/new_step2"
  end

  def show_switcher(kind:, id:)
    redirect_to inner_sashes_show_path(id) if kind == 'inner_sash' 
    #他のモデルが追加されたら分岐を追加
  end

  def destroy(kind:, child_id:)
    #他のモデルが追加されたら分岐を追加
    if kind == 'inner_sash'
      @inner_sash = InnerSash.find(child_id)
      @inner_sash.destroy_last_with(site_memo: @inner_sash.site_memo)
    end
    flash.now.notice = 'メモを削除しました'
  end

  private

  def update_childs_order(site_memos:, order:)
    #site_memosモデルに子モデルができたら条件追加。コメントアウトも外す
    site_memos.each do |site_memo|
      site_memo.inner_sashes.update_all(order: order) if site_memo.kind == 'inner_sash'
    end
  end
end
