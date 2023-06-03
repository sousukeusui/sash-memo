class ConstructionMaterial < ApplicationRecord
  belongs_to :site_memo

  validates :room, presence: true, length: { maximum: 15 }
end
