class AddIsOrderToInnerSashes < ActiveRecord::Migration[7.0]
  def change
    add_column :inner_sashes, :order, :integer, null: false, default: 0
  end
end
