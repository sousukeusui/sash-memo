class RemoveConstructionKindFromSiteMemo < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :site_memos, :construction_kinds
    remove_index :site_memos, :construction_kind_id
    remove_reference :site_memos, :construction_kind
  end
end
