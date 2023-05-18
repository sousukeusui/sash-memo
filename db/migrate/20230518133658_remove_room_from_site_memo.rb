class RemoveRoomFromSiteMemo < ActiveRecord::Migration[7.0]
  def change
    remove_column :site_memos, :room, :string
  end
end
