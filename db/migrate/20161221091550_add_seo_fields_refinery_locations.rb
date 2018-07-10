class AddSeoFieldsRefineryLocations < ActiveRecord::Migration
  def change
    add_column :refinery_locations, :browser_title, :string
    add_column :refinery_locations, :meta_description, :string
  end
end
