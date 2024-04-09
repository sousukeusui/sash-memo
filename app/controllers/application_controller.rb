class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    sites_index_path
  end

  def get_opposite_order_key(site_memos: nil, inner_sash: nil)
    orders = site_memos.pluck(:order) if site_memos
    order = inner_sash.site_memo.order if inner_sash
    return "unordered" if orders&.all?{ |order| order == "ordered" } || inner_sash == 'ordered'
    return "ordered"
  end
end
