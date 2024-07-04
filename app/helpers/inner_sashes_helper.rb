module InnerSashesHelper
  def calc_order_size(*size)
    return size.min
  end

  def boolean_to_int(boolean)
    return 1 if boolean
    return 0
  end

  def is_active(template, compare)
    return 'active' if template == compare 
  end
end
