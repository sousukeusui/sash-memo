class CreateContractors < ActiveRecord::Migration[6.1]
  def change
    create_table :contractors do |t|
      t.string :name, null: false ,limit: 30
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
