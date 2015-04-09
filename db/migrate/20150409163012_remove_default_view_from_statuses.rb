class RemoveDefaultViewFromStatuses < ActiveRecord::Migration
  def change
    remove_column :statuses, :default_view?, :boolean
  end
end
