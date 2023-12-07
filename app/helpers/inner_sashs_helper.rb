module InnerSashsHelper
  def min_size(*size)
    return size.min
  end
  
  def site_memo_children(site_memo)
    return site_memo.inner_sashes if site_memo.kind == 'inner_sash'
  end
end
