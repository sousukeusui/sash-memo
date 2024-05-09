class SiteMemoForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :width_up_size
  attribute :width_down_size
  attribute :width_middle_size
  attribute :height_left_size
  attribute :height_middle_size
  attribute :height_right_size
  attribute :width_frame_depth
  attribute :height_frame_depth
  attribute :kind

  validates :room, presence: true, length: { maximum:15 }
  validates :width_up_size, presence: true, size: true
  validates :width_down_size, presence: true, size: true
  validates :width_middle_size, presence: true, size: true
  validates :height_left_size, presence: true, size: true
  validates :height_middle_size, presence: true, size: true
  validates :height_right_size, presence: true, size: true
  validates :width_frame_depth, presence: true, size: true
  validates :height_frame_depth, presence: true ,size: true

  
end