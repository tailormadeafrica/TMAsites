class AddExceptCommunicationToRefineryInquiriesInquiries < ActiveRecord::Migration
  def change
    add_column :refinery_inquiries_inquiries, :except_communication, :boolean
  end
end
