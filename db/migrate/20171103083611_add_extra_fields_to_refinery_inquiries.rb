class AddExtraFieldsToRefineryInquiries < ActiveRecord::Migration
  def change
    add_column :refinery_inquiries_inquiries, :currency, :string
  end
end
