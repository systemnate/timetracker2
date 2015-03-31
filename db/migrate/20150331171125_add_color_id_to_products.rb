class AddColorIdToProducts < ActiveRecord::Migration
  def change
    add_column :products, :color_id, :integer
    add_index :products, :color_id
  end
end