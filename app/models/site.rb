class Site < ApplicationRecord
  belongs_to :user
  belongs_to :contractor
  has_many :site_memos, dependent: :destroy
  accepts_nested_attributes_for :contractor

 validates :name, presence: true, length: {maximum: 30}
 validates :address, presence: true, length: {maximum: 50}

 #viewで入力されたcontractorがあるかないかを調べてデータの作り方決める
 def self.create_with_contractor_or_find(site:)
  user_id = site[:user_id]
  contractor_name = site[:contractor_attributes][:name]
  contractor = Contractor.find_by_name_and_user(name: contractor_name, user_id: user_id)

  if contractor
    # siteのみ作りたい処理
    site.delete(:contractor_attributes)
    site[:contractor_id] = contractor.id
  else
    # contractorも一緒に作りたいので、contractorにuserを紐づける
    site[:contractor_attributes][:user_id] = user_id
  end

  self.create!(site)
 end
end
