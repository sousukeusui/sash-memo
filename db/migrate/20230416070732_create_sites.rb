class CreateSites < ActiveRecord::Migration[6.1]
  def change
    create_table :sites do |t|
      t.string :name, null: false, limit: 30
      t.string :address, null: false, limit: 50
      t.date :research_date
      t.time :research_start_time
      t.date :construction_date
      t.time :construction_start_time
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
