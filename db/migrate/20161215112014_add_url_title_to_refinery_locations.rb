class AddUrlTitleToRefineryLocations < ActiveRecord::Migration
  def change
    add_column :refinery_locations, :url_title, :string
  end
end
