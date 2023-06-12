class SiteMemo < ApplicationRecord
  enum kind: { inner_sash: 0 } 

  belongs_to :site
  has_many :inner_sashes

  validates :kind, presence: true
end
