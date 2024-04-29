class ChangeInnerSashPhotosToPhotos < ActiveRecord::Migration[7.0]
  def change
    rename_table :inner_sash_photos, :photos
  end
end
