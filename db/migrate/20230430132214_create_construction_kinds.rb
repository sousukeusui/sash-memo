class CreateConstructionKinds < ActiveRecord::Migration[7.0]
  def change
    create_table :construction_kinds do |t|
      t.integer :kind_number, null: false

      t.timestamps
    end
  end
end
