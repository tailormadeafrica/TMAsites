class AddSlugToRefineryAccommodations < ActiveRecord::Migration
  def change
    add_column :refinery_accommodations, :slug, :string
  end
end
