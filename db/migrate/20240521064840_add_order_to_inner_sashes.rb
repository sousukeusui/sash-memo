class AddOrderToInnerSashes < ActiveRecord::Migration[7.0]
  def change
    add_column :inner_sashes, :order, :integer, default: 0, null: false
  end
end
