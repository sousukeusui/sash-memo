class SiteMemosController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_site, only: [:new_step1]
  before_action :correct_child, only: [:show_switcher]


  permits :kind

  def index(site_id:)
    #site_memosに新しい子モデルができたらそれに応じて取得するものを動的に変える    
    @site = current_user.sites.preload(site_memos: :inner_sashes).find(site_id)
    #あとでページネーションを考える
    @site_memos = @site.site_memos
    @order_key = get_opposite_order_key(site_memos: @site_memos)
  end

  def update_bulk_order(site_id:, order:)
    @site = current_user.sites.preload(site_memos: :inner_sashes).find(site_id)
    @site_memos = @site.site_memos
    update_childs_order(site_memos: @site_memos, order: order)
    # あとでページネーション考える
    @order_key = get_opposite_order_key(site_memos: @site_memos)
    flash.now.notice = "全て#{ InnerSash.orders_i18n[order.to_sym]}にしました"
  end

  def new_step1(site_id:)
    session[:site_id] = site_id
    @site_memo = SiteMemo.new
  end

  def form_switcher(site_memo)
    kind = site_memo[:kind]
    site_id = session[:site_id]

    # 新規作成用
    @site_memo = SiteMemo.new(site_id: site_id, kind: kind)
    # 既存を取得
    ex_sash_memo = SiteMemo.find_by(site_id: site_id, kind: kind)

    if ex_sash_memo.blank? && @site_memo.save
      return redirect_to "/#{kind.pluralize}/new_step2"
    elsif ex_sash_memo.blank?
      return render 'new_step1', status: :unprocessable_entity
    end

    # 既存のデータがあるならダイレクト先でデータを更新していく
    kind = ex_sash_memo.kind.to_s.pluralize
    status = ex_sash_memo.status

    return redirect_to "/#{kind}/new_#{status}" if ex_sash_memo && status !='comfirmation'
    return redirect_to "/#{kind}/new_step2"
  end

  def show_switcher(kind:, child_id:)
    redirect_to inner_sashes_show_path(id: child_id) if kind == 'inner_sash' 
    #他のモデルが追加されたら分岐を追加
  end

  def destroy(kind:, child_id:)
    #site_memo/indexに表示されているinner_sashを削除。その後turbo_stream
    #他のモデルが追加されたら分岐を追加
    @inner_sash = InnerSash.find(child_id) if kind == 'inner_sash'
    @inner_sash&.destroy_last_with(site_memo: @inner_sash.site_memo)
    flash.now.notice = 'メモを削除しました'
  end

  private

  def update_childs_order(site_memos:, order:)
    #site_memosモデルに子モデルができたら条件追加。コメントアウトも外す
    site_memos.each do |site_memo|
      site_memo.inner_sashes.update_all(order: order) if site_memo.kind == 'inner_sash'
    end
  end

  def correct_child(kind:, child_id:)
    #子モデルが追加され次第分岐する
    inner_sash = InnerSash.find(child_id) # if kind == 'inner_sash'
    redirect_to root_path if inner_sash.site_memo.site.user_id != current_user.id
  end

  def correct_site(site_id:)
    @site = Site.find(site_id)
    redirect_to root_path if @site.user_id != current_user.id
  end
end
