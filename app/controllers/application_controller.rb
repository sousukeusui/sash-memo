class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    sites_index_path
  end

  def get_opposite_order_key(site_memos: nil,inner_sash: nil)
    orders = []
    site_memos.each do |site_memo|
      # site_memoの子テーブルが出来次第ここに処理追加
      orders << site_memo.inner_sashes.pluck(:order) if site_memo.kind == 'inner_sash'
    end

    orders << inner_sash.order if inner_sash
    return "unordered" if orders&.all?{ |order| order == "ordered" }
    return "ordered"
  end
end
