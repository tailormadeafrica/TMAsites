class AddBreadToRefineryAccommodations < ActiveRecord::Migration
  def change
    add_column :refinery_accommodations, :bread, :string
  end
end
