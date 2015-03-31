class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.text :contact
      t.text :connect_info

      t.timestamps null: false
    end
  end
end
