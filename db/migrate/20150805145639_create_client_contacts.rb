class CreateClientContacts < ActiveRecord::Migration
  def change
    create_table :client_contacts do |t|
      t.string :name
      t.string :address
      t.string :email
      t.string :phone_number
      t.text :other
      t.references :client, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
