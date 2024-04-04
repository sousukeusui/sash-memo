class SiteMemo < ApplicationRecord
  enum kind: { inner_sash: 0 } 
  enum status: { draft: 0, published: 1}
  enum order: { unordered: 0 , ordered: 1 }

  belongs_to :site
  has_one :inner_sash, dependent: :destroy
  accepts_nested_attributes_for :inner_sash

  validates :kind, presence: true
  validates :status ,presence: true
  validates :room, presence: true, length: { maximum:15 }
  validates :remark, length: { maximum:100 }

  def update_order(order:)
    case order
    when 'ordered'
      #内窓の場合
      self.inner_sashes.update_all(order: InnerSash.orders[:ordered]) if self.kind == 'inner_sash'
      #以下にドアや網戸の場合も追加していく
    when 'unordered'
      self.inner_sashes.update_all(order: InnerSash.orders[:unordered]) if self.kind == 'inner_sash'
    end
  end
end
