class InnerSash < ApplicationRecord
  belongs_to :site_memo

  validates :width_up_size, presence: true
  validates :width_middle_size, presence: true
  validates :width_down_size, presence: true
  validates :height_left_size, presence: true
  validates :height_middle_size, presence: true
  validates :height_right_size, presence: true
  validates :height_frame_depth, presence: true
  validates :width_frame_depth, presence: true
  validates :color, presence: true
  validates :number_of_shoji, presence: true
  validates :site_memo_id, presence: true, on: :save_site_memo_id
  validates :room, presence: true, length: { maximum: 15 }
end
