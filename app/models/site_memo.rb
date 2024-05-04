class SiteMemo < ApplicationRecord
  enum kind: { inner_sash: 0 } 
  enum status: { step1: 0, step2: 1, step3: 2, step4: 3, published: 4  }
  enum order: { unordered: 0 , ordered: 1 }

  belongs_to :site
  has_one :inner_sash, dependent: :destroy
  accepts_nested_attributes_for :inner_sash

  validates :kind, presence: true
  validates :status ,presence: true
  validates :room, presence: true, length: { maximum:15 }
  validates :remark, length: { maximum:100 }

end
