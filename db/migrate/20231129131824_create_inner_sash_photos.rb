class CreateInnerSashPhotos < ActiveRecord::Migration[7.0]
  def change
    create_table :inner_sash_photos do |t|
      t.string :file_name, null: false
      t.references :inner_sash, null: false, foreign_key: true

      t.timestamps
    end
  end
end
