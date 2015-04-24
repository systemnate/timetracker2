class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.integer :user_id
      t.integer :allotted_time
      t.integer :time_spent
      t.date :due_date

      t.timestamps null: false
    end
  end
end
