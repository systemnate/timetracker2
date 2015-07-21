class AddMoreIndexes < ActiveRecord::Migration
  def change
    add_index :tasks, :status_id
  end
end
