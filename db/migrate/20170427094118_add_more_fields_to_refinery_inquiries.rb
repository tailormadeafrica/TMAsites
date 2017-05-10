class AddMoreFieldsToRefineryInquiries < ActiveRecord::Migration
  def change
    add_column :refinery_inquiries_inquiries, :budget, :string
    add_column :refinery_inquiries_inquiries, :destination, :string
    add_column :refinery_inquiries_inquiries, :from, :string
    add_column :refinery_inquiries_inquiries, :first_trip, :boolean
  end
end
