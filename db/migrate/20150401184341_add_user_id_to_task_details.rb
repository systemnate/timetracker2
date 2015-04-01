class AddUserIdToTaskDetails < ActiveRecord::Migration
  def change
    add_reference :task_details, :user, index: true
    add_foreign_key :task_details, :users
  end
end
