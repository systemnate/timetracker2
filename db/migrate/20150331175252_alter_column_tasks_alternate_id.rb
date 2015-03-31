class AlterColumnTasksAlternateId < ActiveRecord::Migration
  def change
    change_column :tasks, :alternate_id, :string
  end
end
