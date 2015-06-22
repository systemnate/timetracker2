class RemoveSummaryFromTasks < ActiveRecord::Migration
  def change
    remove_column :tasks, :summary, :text
  end
end
