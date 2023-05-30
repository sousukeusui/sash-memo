class ConstructionMaterial < ApplicationRecord
  belongs_to :site_memo

  validates :room, presence: true, limit: { maximum: 15 }
end
