class SiteMemo < ApplicationRecord
  belongs_to :site
  has_many :construction_materials
end
