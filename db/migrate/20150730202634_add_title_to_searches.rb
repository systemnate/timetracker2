class AddTitleToSearches < ActiveRecord::Migration
  def change
    add_column :searches, :title, :string
  end
end
