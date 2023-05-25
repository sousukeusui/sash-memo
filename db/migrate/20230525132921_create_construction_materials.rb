class CreateConstructionMaterials < ActiveRecord::Migration[7.0]
  def change
    create_table :construction_materials do |t|
      t.integer :kind, null: false
      t.string :room , null: false, limit: 15
      t.references :site, null: false, foreign_key: true

      t.timestamps
    end
  end
end
