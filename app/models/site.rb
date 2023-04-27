class Site < ApplicationRecord
  belongs_to :user
  belongs_to :contractor

 validates :name, presence: true, length: {maximum: 30}
 validates :address, presence: true, length: {maximum: 50}
end
