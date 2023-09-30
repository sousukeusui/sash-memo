class CreateInnerDoubleSlidings < ActiveRecord::Migration[7.0]
  def change
    create_table :inner_double_slidings do |t|
      t.integer :middle_frame_size, null: false
      t.integer :key_size, null: false
      t.boolean :is_adjust, default: false, null: false
      t.references :inner_sash, null: false, foreign_key: true

      t.timestamps
    end
  end
end
