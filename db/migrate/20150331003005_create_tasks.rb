class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.integer :status_id
      t.integer :product_id
      t.text :summary
      t.integer :priority_id
      t.integer :client_id

      t.timestamps null: false
    end
  end
end
