class SiteMemo < ApplicationRecord
  belongs_to :site
  has_many :construction_materials

  validates :kind, presence: true
end
