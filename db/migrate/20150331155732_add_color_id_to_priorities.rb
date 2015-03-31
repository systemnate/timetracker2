class AddColorIdToPriorities < ActiveRecord::Migration
  def change
    add_column :priorities, :color_id, :integer
    add_index :priorities, :color_id
  end
end
