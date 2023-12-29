class SiteMemo < ApplicationRecord
  enum kind: { inner_sash: 0 } 
  enum status: { draft: 0, published: 1}
  enum judge_order: { unordered: 0, ordered: 1}

  belongs_to :site
  has_many :inner_sashes, dependent: :destroy
  accepts_nested_attributes_for :inner_sashes

  validates :kind, presence: true
  validates :status ,presence: true
end
