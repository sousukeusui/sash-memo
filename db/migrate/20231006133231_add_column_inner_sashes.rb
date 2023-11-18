class AddColumnInnerSashes < ActiveRecord::Migration[7.0]
  def change
    add_column :inner_sashes, :is_flat_bar, :boolean, null: false, default: false
    add_column :inner_sashes, :key_size,  :integer, null: false, default: 0
    add_column :inner_sashes, :sash_type, :integer, null: false, default: 0
    add_column :inner_sashes, :middle_frame_size, :integer, null: false, default: 0
    add_column :inner_sashes, :is_adjust, :boolean, null: false, default: false
    add_column :inner_sashes, :hanging_origin, :integer, null: false, default: 0
    remove_column :inner_sashes, :flat_bar_size, :integer
  end
end
