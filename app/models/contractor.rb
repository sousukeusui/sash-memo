class Contractor < ApplicationRecord
  belongs_to :user
  has_many :sites

  validates :name, presence: true, length: {maximum: 30}
end
