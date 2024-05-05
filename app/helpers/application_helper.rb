module ApplicationHelper
  def turbo_stream_flash
    turbo_stream.update 'flash-msg', partial: 'layouts/flash'
  end

  def turbo_stream_error_msg(model:)
    turbo_stream.update 'flash-msg' , partial: 'layouts/error_messages', locals: {model: model }
  end
end
