class AddColorIdToStatuses < ActiveRecord::Migration
  def change
    add_column :statuses, :color_id, :integer
    add_index :statuses, :color_id
  end
end