class ConstructionMaterial < ApplicationRecord
  enum kind:{inner_sash: 0}

  belongs_to :site
end
