module SitesHelper
  def check_schedule(date:)
    return '未定' if date == nil
    return l date, format: :short
  end

  def check_order(site_memos:)
    return if site_memos.blank?
    # site_memoの子テーブルが出来次第ここに処理追加
    orders = site_memos.flat_map{ |site_memo| site_memo.inner_sashes&.pluck(:order)}
    return '発注済み' if orders.all?{|n| n == 'ordered'}
    return '未発注'
  end
end
