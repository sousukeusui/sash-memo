class ConstructionKind < ApplicationRecord
  enum kind_number: { inner_sash: 0 }
  
  has_many :site_memos
end
