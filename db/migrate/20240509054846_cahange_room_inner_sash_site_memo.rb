class CahangeRoomInnerSashSiteMemo < ActiveRecord::Migration[7.0]
  def change
    add_column :inner_sashes, :room, :string, limit: 15
    remove_column :site_memos, :room
  end
end
