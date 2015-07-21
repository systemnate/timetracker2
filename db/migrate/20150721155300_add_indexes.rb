class AddIndexes < ActiveRecord::Migration
  def change
    add_index :accounts, :owner_id
    add_index :projects, :user_id
    add_index :projects, :client_id
    add_index :task_details, :task_id
    add_index :tasks, :product_id
    add_index :tasks, :priority_id
    add_index :tasks, :client_id
    add_index :tasks, :project_id
    add_index :users, :role_id
    add_index :users, [:invited_by_id, :invited_by_type]
  end
end
