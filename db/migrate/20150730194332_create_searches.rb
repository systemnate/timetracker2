class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.integer :task_id
      t.string :keywords
      t.integer :status_id
      t.integer :product_id
      t.integer :priority_id
      t.integer :client_id
      t.date :created_at
      t.date :updated_at
      t.string :alternate_id
      t.integer :assigned_to
      t.boolean :billable
      t.integer :project_id
      t.integer :created_by

      t.timestamps null: false
    end
  end
end
