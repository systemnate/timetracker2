class AddPositionToClients < ActiveRecord::Migration
  def change
    add_column :clients, :position, :integer
  end
end
