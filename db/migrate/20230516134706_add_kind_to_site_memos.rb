class AddKindToSiteMemos < ActiveRecord::Migration[7.0]
  def change
    add_column :site_memos, :kind, :integer, null: false
  end
end
