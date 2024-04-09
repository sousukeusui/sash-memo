class AddColumnsToSiteMemo < ActiveRecord::Migration[7.0]
  def change
    add_column :site_memos, :room, :string, null: false, limit: 15
    add_column :site_memos, :order, :integer, null: false, default: 0
    add_column :site_memos, :remark, :string, limit: 100
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
