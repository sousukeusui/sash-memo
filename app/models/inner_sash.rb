class InnerSash < ApplicationRecord
  belongs_to :site_memo
  has_many :inner_double_slidings
  has_many :inner_casements

  enum color: { c_undecided: 0, white: 1}
  enum sash_type: { t_undecided: 0, sliding: 1, opening: 2}
  enum hanging_origin: { h_undecided: 0, right: 1, left: 2}

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
    validates :remark, length: { maximum:100 }
    validates :is_flat_bar, inclusion: {in: [true, false]}
    validates :key_height, presence: true
    validates :sash_type, presence: true
    validates :middle_frame_height, presence: true
    validates :is_adjust, inclusion: {in: [true, false]}
    validates :hanging_origin, presence: true

    #site_memo_idを排除するかコントローラーで入れるか
    #colorなど他のバリデーションも追加
end
