class InnerSashPhoto < ApplicationRecord
  belongs_to :inner_sash
  mount_uploader :file_name, InnnerSashPhotoUploader
end
