class RemoveColumnsFromInnerSashes < ActiveRecord::Migration[7.0]
  def change
    remove_column :inner_sashes, :room
    remove_column :inner_sashes, :order
    remove_column :inner_sashes, :remark
  end
end
