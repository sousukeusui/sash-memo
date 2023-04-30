class SiteMemo < ApplicationRecord
  belongs_to :construction_kind_id
  belongs_to :site_id
end
