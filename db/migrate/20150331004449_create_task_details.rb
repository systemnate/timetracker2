class CreateTaskDetails < ActiveRecord::Migration
  def change
    create_table :task_details do |t|
      t.text :body
      t.integer :time_spent, default: 1
      t.integer :task_id
      t.boolean :important, default: false

      t.timestamps null: false
    end
  end
end
