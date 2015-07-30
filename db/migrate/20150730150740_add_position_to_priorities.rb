class AddPositionToPriorities < ActiveRecord::Migration
  def change
    add_column :priorities, :position, :integer
  end
end
