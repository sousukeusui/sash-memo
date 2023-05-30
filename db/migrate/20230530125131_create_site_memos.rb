class CreateSiteMemos < ActiveRecord::Migration[7.0]
  def change
    create_table :site_memos do |t|
      t.integer :kind, null: false
      t.references :site, null: false, foreign_key: true

      t.timestamps
    end
  end
end
