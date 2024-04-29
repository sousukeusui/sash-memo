class Photo < ApplicationRecord
  belongs_to :inner_sash
  mount_uploader :file_name, PhotoUploader
end
