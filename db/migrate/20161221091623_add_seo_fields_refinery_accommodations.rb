class AddSeoFieldsRefineryAccommodations < ActiveRecord::Migration
  def change
    add_column :refinery_accommodations, :browser_title, :string
    add_column :refinery_accommodations, :meta_description, :string
  end
end
