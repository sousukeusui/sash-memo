module SitesHelper
  def check_schedule(date)
    if date == nil
      return '未定'
    else 
      return l date, format: :short
    end
  end
end
