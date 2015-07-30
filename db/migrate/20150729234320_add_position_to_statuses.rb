class AddPositionToStatuses < ActiveRecord::Migration
  def change
    add_column :statuses, :position, :integer
  end
end
