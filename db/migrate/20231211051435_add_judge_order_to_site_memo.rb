class AddJudgeOrderToSiteMemo < ActiveRecord::Migration[7.0]
  def change
    add_column :site_memos, :judge_order, :integer, null: false, default: 0
  end
end
