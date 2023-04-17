class AddContractorIdToSites < ActiveRecord::Migration[6.1]
  def change
    add_reference :sites, :contractor, foreign_key: true, null: false
  end
end
