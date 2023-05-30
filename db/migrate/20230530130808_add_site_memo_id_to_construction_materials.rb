class AddSiteMemoIdToConstructionMaterials < ActiveRecord::Migration[7.0]
  def change
    add_reference :construction_materials, :site_memo, foreign_key: true
  end
end
