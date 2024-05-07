module ApplicationHelper
  def turbo_stream_flash
    turbo_stream.update 'flash-msg', partial: 'layouts/flash'
  end

  def turbo_stream_alert
    turbo_stream.update 'flash-msg' , partial: 'layouts/alert'
  end
end
