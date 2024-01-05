module SiteMemosHelper
  def site_memo_children(site_memo)
    return site_memo.inner_sashes if site_memo.kind == 'inner_sash'
  end
end
