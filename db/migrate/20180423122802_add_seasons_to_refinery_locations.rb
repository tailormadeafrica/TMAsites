class AddSeasonsToRefineryLocations < ActiveRecord::Migration
  def change
    add_column :refinery_locations, :low, :string
    add_column :refinery_locations, :medium, :string
    add_column :refinery_locations, :high, :string
  end
end
