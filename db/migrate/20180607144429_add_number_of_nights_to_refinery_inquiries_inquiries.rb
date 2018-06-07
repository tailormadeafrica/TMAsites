class AddNumberOfNightsToRefineryInquiriesInquiries < ActiveRecord::Migration
  def change
    add_column :refinery_inquiries_inquiries, :number_of_nights, :string
  end
end
