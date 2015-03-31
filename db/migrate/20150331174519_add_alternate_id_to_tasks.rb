class AddAlternateIdToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :alternate_id, :integer
  end
end
