class SiteMemo < ApplicationRecord
  belongs_to :construction_kind
  belongs_to :site
end
