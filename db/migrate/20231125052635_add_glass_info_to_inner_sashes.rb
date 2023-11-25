class AddGlassInfoToInnerSashes < ActiveRecord::Migration[7.0]
  def change
    add_column :inner_sashes, :glass_color, :integer, null: false, default: 0
    add_column :inner_sashes, :glass_tickness, :integer, null: false, default: 0
    add_column :inner_sashes, :glass_kind, :integer, null: false, default: 0
    add_column :inner_sashes, :is_low_e, :boolean, null: false, default: false
  end
end
