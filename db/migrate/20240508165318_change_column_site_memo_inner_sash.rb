class ChangeColumnSiteMemoInnerSash < ActiveRecord::Migration[7.0]
  def change
    InnerSash.update_all(room: Faker::House.room)

    change_column_null :inner_sashes, :room, false
  end
end
