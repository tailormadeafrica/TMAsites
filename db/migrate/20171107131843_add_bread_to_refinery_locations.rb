class AddBreadToRefineryLocations < ActiveRecord::Migration
  def change
    add_column :refinery_locations, :bread, :string
  end
end
