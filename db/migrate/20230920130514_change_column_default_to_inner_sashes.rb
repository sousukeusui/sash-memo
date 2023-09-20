class ChangeColumnDefaultToInnerSashes < ActiveRecord::Migration[7.0]
  def change
    change_column_default :inner_sashes, :color, from: nil, to: 0
    change_column_default :inner_sashes, :number_of_shoji, from: nil, to: 0
  end
end
