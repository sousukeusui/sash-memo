class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    sites_index_path
  end

  def get_opposite_order_key(site_memos: nil,inner_sash: nil)
    #site_memosの子テーブルが増え次第、条件追加
    orders = site_memos&.flat_map { |site_memo| site_memo.inner_sashes.pluck(:order) } # site_memosの子がinner_sashの時
    judge_order = orders&.all?{ |order| order == 'ordered'}

    return "unordered" if inner_sash&.order == 'ordered' || judge_order
    return "ordered"
  end
end
