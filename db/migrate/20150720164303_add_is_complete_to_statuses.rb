class AddIsCompleteToStatuses < ActiveRecord::Migration
  def change
    add_column :statuses, :is_complete, :boolean, default: false
  end
end
