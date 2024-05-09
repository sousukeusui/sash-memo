class InnerSashForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :room
  attribute :width_up_size
  attribute :width_down_size
  attribute :width_middle_size
  attribute :height_left_size
  attribute :height_middle_size
  attribute :height_right_size
  attribute :width_frame_depth
  attribute :height_frame_depth
  attribute :number_of_shoji

  validates :room, presence: true, length: { maximum:15 }
  validates :width_up_size, presence: true, size: true
  validates :width_down_size, presence: true, size: true
  validates :width_middle_size, presence: true, size: true
  validates :height_left_size, presence: true, size: true
  validates :height_middle_size, presence: true, size: true
  validates :height_right_size, presence: true, size: true
  validates :width_frame_depth, presence: true, size: true
  validates :height_frame_depth, presence: true ,size: true

  def initialze(attributes = {})
    super attributes
  end

  def save(site_id:)
    return false if invalid?

    

    ActiveRecord::Base.transaction do
      site_memo = SiteMemo.find_by(site_id: site_id)
      p site_memo, site_id
      site_memo.inner_sashes.build(attributes).save!
    end
  end


end