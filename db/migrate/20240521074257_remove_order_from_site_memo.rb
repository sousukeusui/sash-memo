class RemoveOrderFromSiteMemo < ActiveRecord::Migration[7.0]
  def change
    remove_column :site_memos, :order
  end
end
