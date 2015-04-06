class AddBillableToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :billable, :boolean
  end
end
