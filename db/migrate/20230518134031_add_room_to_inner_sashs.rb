class AddRoomToInnerSashs < ActiveRecord::Migration[7.0]
  def change
    add_column :inner_sashes, :room, :string, null: false, limit: 15
  end
end
