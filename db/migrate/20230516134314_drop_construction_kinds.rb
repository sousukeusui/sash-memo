class DropConstructionKinds < ActiveRecord::Migration[7.0]
  def change
    drop_table :construction_kinds
  end
end
