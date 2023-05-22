class SiteMemo < ApplicationRecord
  enum kind:{inner_sash: 0}

  belongs_to :site
  has_many :inner_sashs, dependent: :destroy

  validates :site_id, presence: true
  validates :kind, presence: true

  accepts_nested_attributes_for :inner_sashs, allow_destroy: true

end
