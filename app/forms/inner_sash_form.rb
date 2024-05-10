class InnerSashForm
  attr_accessor :inner_sashes

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
  attribute :color
  attribute :is_flat_bar
  attribute :key_height
  attribute :sash_type
  attribute :number_of_shoji
  attribute :middle_frame_height
  attribute :is_adjust
  attribute :hanging_origin
  attribute :glass_color
  attribute :glass_kind
  attribute :glass_thickness
  attribute :is_low_e

  validates :room, presence: true, length: { maximum:15 }
  validates :width_up_size, presence: true, size: true
  validates :width_down_size, presence: true, size: true
  validates :width_middle_size, presence: true, size: true
  validates :height_left_size, presence: true, size: true
  validates :height_middle_size, presence: true, size: true
  validates :height_right_size, presence: true, size: true
  validates :width_frame_depth, presence: true, size: true
  validates :height_frame_depth, presence: true ,size: true

  def initialize(attributes = {}, inner_sashes:)
    # インスタンス変数に作成または変更したいインスタンスを代入するとフォームに表示される
    # これはviewでfields_Forを使いたい時にコントローラーで子モデルをビルドしてインスタンス変数に代入するのと似ている
    @inner_sashes = inner_sashes
    
    # コントローラーで代入したパラメーター
    super attributes
  end

  def inner_sashes_attributes=(attributes)
    p "ここだよ#{attributses}"
    #InnerSashFormのinner_sashesに必要な情報を入れる。
    #そしてviewのfields_forで使えるようになる
    self.inner_sashes = attributes.map { |_, v| InnerSash.new(v) }
    p self.inner_sashes
  end

  def save(site_id:)
    p attributes
    return false if invalid?

    site_memo = SiteMemo.find_by(site_id: site_id)
    site_memo.inner_sashes.update(attributes)
  end


end