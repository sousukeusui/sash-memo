module ConvertCharacter
  extend ActiveSupport::Concern

  def to_kana
    self.tr('あ-ん','ア-ン')
  end

  def to_hira
    self.tr('ア-ン','あ-ん')
  end
end

class String
  include ConvertCharacter
end
