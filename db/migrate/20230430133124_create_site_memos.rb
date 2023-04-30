class CreateSiteMemos < ActiveRecord::Migration[7.0]
  def change
    create_table :site_memos do |t|
      t.string :room, null: false, limit: 15
      t.references :construction_kind, null: false, foreign_key: true
      t.references :site, null: false, foreign_key: true

      t.timestamps
    end
  end
end
