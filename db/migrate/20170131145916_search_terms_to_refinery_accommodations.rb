class SearchTermsToRefineryAccommodations < ActiveRecord::Migration
  def change
    add_column :refinery_accommodations, :inclusion, :text
    add_column :refinery_accommodations, :exclusion, :text
  end
end
