class CreateSites < ActiveRecord::Migration[6.1]
  def change
    create_table :sites do |t|
      t.string :name, null: false, limit: 30
      t.string :address, null: false, limit: 50
      t.datetime :research_date 
      t.datetime :construction_date
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
