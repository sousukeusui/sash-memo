class RemoveKindFromConstructionMaterials < ActiveRecord::Migration[7.0]
  def change
    remove_column :construction_materials, :kind
    remove_foreign_key :construction_materials, :sites
    remove_index :construction_materials, :site_id
    remove_reference :construction_materials, :site
  end
end
