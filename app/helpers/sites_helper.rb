module SitesHelper
  def check_schedule(date)
    return '未定' if date == nil
    return l date, format: :short
  end

  def check_order(site_memos)
    return if site_memos.blank?
    order = []
    site_memos.each do |site_memo|
      # site_memoの子テーブルが出来次第ここに処理追加
      order << site_memo.inner_sashes.pluck(:order) if site_memo.kind == 'inner_sash'
    end
    return '発注済み' if order.all?{|n| n == 'ordered'}
    return '未発注'
  end
end
