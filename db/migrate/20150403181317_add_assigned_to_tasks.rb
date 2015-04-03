class AddAssignedToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :assigned_to, :integer
    add_index :tasks, :assigned_to
  end
end
