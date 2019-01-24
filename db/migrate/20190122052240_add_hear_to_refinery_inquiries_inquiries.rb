class AddHearToRefineryInquiriesInquiries < ActiveRecord::Migration
  def change
    add_column :refinery_inquiries_inquiries, :hear, :string
  end
end
