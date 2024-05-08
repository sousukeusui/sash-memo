class SizeValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if value.blank?

    record.errors.add(attribute, 'は５桁以内で入力してください') if value.to_s.length > 5
  end
end