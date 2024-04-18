module InnerSashesHelper
  def min_size(*size)
    return size.min
  end

#あとでmin_sizeをcalc_order_sizeに置き換える
  def calc_order_size(*size)
    return size.min
  end
end
