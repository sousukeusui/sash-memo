module InnerSashesHelper
  def calc_order_size(*size)
    return size.min
  end
end
