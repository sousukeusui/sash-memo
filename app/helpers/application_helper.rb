module ApplicationHelper
  def turbo_stream_flash
    turbo_stream.update 'flash-msg', partial: 'layouts/flash'
  end
end
