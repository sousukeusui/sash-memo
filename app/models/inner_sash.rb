class InnerSash < ApplicationRecord
  attr_accessor :action

  belongs_to :site_memo, dependent: :destroy
  has_many :photos, dependent: :destroy
  accepts_nested_attributes_for :photos, allow_destroy: true

  enum color: { c_undecided: 0, white: 1}
  enum sash_type: { t_undecided: 0, sliding: 1, opening: 2}
  enum hanging_origin: { h_undecided: 0, right: 1, left: 2}
  enum glass_color: { gc_undecided: 0, green: 1, clear: 2}
  enum glass_thickness: { gt_undecided: 0, single: 1, double: 2}
  enum glass_kind: { gk_undecided: 0, transparent: 1, hazy: 2}

  validates :room, presence: true, length: { maximum:15 }
  validates :width_up_size, presence: true, size: true
  validates :width_down_size, presence: true, size: true
  validates :width_middle_size, presence: true, size: true
  validates :height_left_size, presence: true, size: true
  validates :height_middle_size, presence: true, size: true
  validates :height_right_size, presence: true, size: true
  validates :width_frame_depth, presence: true, size: true
  validates :height_frame_depth, presence: true ,size: true
  validates :color, presence: true
  validates :is_flat_bar, inclusion: {in: [true, false]}
  validates :key_height, presence: true
  validates :sash_type, presence: true
  validates :number_of_shoji, presence: true
  validates :middle_frame_height, presence: true
  validates :is_adjust, inclusion: {in: [true, false]}
  validates :hanging_origin, presence: true 
  validates :glass_color, presence: true
  validates :glass_kind, presence: true
  validates :glass_thickness, presence: true
  validates :is_low_e, inclusion: {in: [true, false]}

  def previous
    InnerSash.eager_load(site_memo: :site).where(site: {id: self.site_memo.site_id}).where("inner_sashes.id<?", self.id).order(id: :desc).first
  end

  def next
    InnerSash.eager_load(site_memo: :site).where(site: {id: self.site_memo.site_id}).where("inner_sashes.id>?", self.id).order(id: :asc).first
  end
end
