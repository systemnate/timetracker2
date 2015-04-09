class AddDefaultViewToStatuses < ActiveRecord::Migration
  def change
    add_column :statuses, :default_view?, :boolean
  end
end
