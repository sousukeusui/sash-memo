class SiteMemo < ApplicationRecord
  enum kind: { inner_sash: 0 } 

  belongs_to :site
  has_many :construction_materials

  validates :kind, presence: true
end
