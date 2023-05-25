class Site < ApplicationRecord
  belongs_to :user
  belongs_to :contractor
  has_many :construction_materials

 validates :name, presence: true, length: {maximum: 30}
 validates :address, presence: true, length: {maximum: 50}
end
