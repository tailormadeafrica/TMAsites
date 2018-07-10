class SearchTermsToRefineryLocations < ActiveRecord::Migration
   def change
    add_column :refinery_locations, :inclusion, :text
    add_column :refinery_locations, :exclusion, :text
  end
end
