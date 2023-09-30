class CreateInnerCasements < ActiveRecord::Migration[7.0]
  def change
    create_table :inner_casements do |t|
      t.integer :hanging_origin, null: false
      t.references :inner_sash, null: false, foreign_key: true

      t.timestamps
    end
  end
end
