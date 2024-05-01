class Contractor < ApplicationRecord
  include ConvertCharacter

  belongs_to :user
  has_many :sites

  validates :name, presence: true, length: {maximum: 30}
  
  scope :suggest_name, -> (name:){ suggest_hira_name(name: name).or(suggest_kana_name(name: name)) }

  scope :suggest_hira_name, -> (name:){ where('name LIKE ? ', "%#{sanitize_sql_like(name.to_s.to_hira)}%") }
  scope :suggest_kana_name, -> (name:){ where('name LIKE ? ', "%#{sanitize_sql_like(name.to_s.to_kana)}%") }
end