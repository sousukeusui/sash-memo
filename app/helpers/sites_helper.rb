module SitesHelper
  def check_schedule(date)
    return '未定' if date == nil
    return l date, format: :short
  end

  def check_order(site_memos)
    return "未発注" if site_memos.blank?
    site_memos.each do |site_memo|
      return site_memo.judge_order_i18n
    end
  end
end
