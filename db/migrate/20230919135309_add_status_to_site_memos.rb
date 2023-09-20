class AddStatusToSiteMemos < ActiveRecord::Migration[7.0]
  def change
    add_column :site_memos, :status, :integer, default: 0, null: false
  end
end
