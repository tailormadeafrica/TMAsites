class AddSideBodyToRefineryAccommodations < ActiveRecord::Migration
  def change
    add_column :refinery_accommodations, :side_body, :text
  end
end
