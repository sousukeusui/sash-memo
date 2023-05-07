class SiteMemo < ApplicationRecord
  belongs_to :construction_kind
  belongs_to :site

  validates :room, presence: true, length: { maximum: 15 }
  validates :site_id, presence: true
  validates :construction_kind_id, presence: true

end
