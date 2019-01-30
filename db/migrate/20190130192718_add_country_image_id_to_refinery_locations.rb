class AddCountryImageIdToRefineryLocations < ActiveRecord::Migration
  def change
    add_column :refinery_locations, :country_image_id, :integer
  end
end
