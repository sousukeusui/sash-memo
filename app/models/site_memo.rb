class SiteMemo < ApplicationRecord
  enum kind:{inner_sash: 0}

  belongs_to :site
  has_one :inner_sash

  validates :room, presence: true, length: { maximum: 15 }
  validates :site_id, presence: true
  validates :kind, presence: true

end
