class SiteMemo < ApplicationRecord
  enum kind: { inner_sash: 0 } 
  enum status: { draft: 0, published: 1}

  belongs_to :site
  has_many :inner_sashes, dependent: :destroy
  accepts_nested_attributes_for :inner_sashes

  validates :kind, presence: true
  validates :status ,presence: true

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

  def include_unordered?
    #内窓の場合
    return self.inner_sashes.pluck(:order).include?('unordered') if self.kind == 'inner_sash'
    #以下にドアや網戸の場合も追加していく
  end
end
