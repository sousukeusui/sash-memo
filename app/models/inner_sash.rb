class InnerSash < ApplicationRecord
  belongs_to :site_memo

  enum color: { undecided: 0, white: 1}

  # validates :color , presence: true 
  # validates :number_of_shoji ,presence: true
  # validates :remark, length: { maximum:100 }

    validates :width_up_size, presence: true
    validates :width_down_size, presence: true
    validates :width_middle_size, presence: true
    validates :height_left_size, presence: true
    validates :height_middle_size, presence: true
    validates :height_right_size, presence: true
    validates :width_frame_depth, presence: true
    validates :height_frame_depth, presence: true
    validates :room, presence: true, length: { maximum:15 }
    validates :color, presence: true
    #site_memo_idを排除するかコントローラーで入れるか
end
