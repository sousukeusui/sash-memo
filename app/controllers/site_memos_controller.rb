class SiteMemosController < ApplicationController
  permits :id, :kind, :site_id

  def index(site_id:)
    @site = Site.find(site_id)
    #site_memoの全ての子モデル結合して取得
    #site_memosに新しい子モデルができたらそれに応じて取得するものを動的に変える    
    @site = Site.preload(site_memos: :inner_sash).find(site_id)
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

  def find_or_create(site_memo)
    # 既存を探す
    site_id = session[:site_id]
    kind = site_memo[:kind]
    session.delete(:site_id) #次のページ以降使うなら消す

    exist_sm = SiteMemo.eager_load(:site).find_by(site_id: site_id, kind: kind)
    redirect_to "/#{exist_sm.kind.to_s.pluralize}/new_#{exist_sm.status}/#{site_id}" and return if exist_sm && exist_sm.status !='published'
    redirect_to "/#{exist_sm.kind.to_s.pluralize}/new_step2/#{site_id}" and return if exist_sm

    # 新規作成
    s_memo = SiteMemo.new(site_memo.merge(site_id: site_id))
    redirect_to "/#{s_memo.kind.to_s.pluralize}/new_step2/site_memo.site_id" and return if s_memo.save
    redirect_to site_memos_new_step1_path(site_id), alert: s_memo.errors.full_messages
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
