module SitesHelper
  def check_schedule(date)
    return '未定' if date == nil
    return l date, format: :short
  end
end
