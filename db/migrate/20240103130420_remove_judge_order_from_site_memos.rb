class RemoveJudgeOrderFromSiteMemos < ActiveRecord::Migration[7.0]
  def change
    remove_column :site_memos, :judge_order, :integer
  end
end
