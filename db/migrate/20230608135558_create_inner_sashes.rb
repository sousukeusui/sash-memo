class CreateInnerSashes < ActiveRecord::Migration[7.0]
  def change
    create_table :inner_sashes do |t|
      t.integer :color, null: false
      t.integer :number_of_shoji, null: false
      t.integer :width_up_size, null: false
      t.integer :width_down_size, null: false
      t.integer :width_middle_size, null: false
      t.integer :height_left_size, null: false
      t.integer :height_right_size, null: false
      t.integer :height_middle_size, null: false
      t.integer :width_frame_depth, null: false
      t.integer :height_frame_depth, null: false
      t.integer :flat_bar_size
      t.string :remark, limit: 100
      t.references :construction_material, null: false, foreign_key: true

      t.timestamps
    end
  end
end
