class SiteMemo < ApplicationRecord
  enum kind: { inner_sash: 0 } 
  enum status: { step2: 0, step3: 1, step4: 2, step5: 3, published: 4 }

  belongs_to :site
  has_many :inner_sashes, dependent: :destroy
  accepts_nested_attributes_for :inner_sashes

  validates :kind, presence: true
  validates :status, presence: true
  validates :remark, length: { maximum:100 }

end
