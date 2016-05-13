module Refinery
  module Bookings
    class Booking < Refinery::Core::BaseModel
      self.table_name = 'refinery_bookings'

      acts_as_indexed :fields => [:full_name, :email, :telephone, :cellphone, :address, :insurance_company, :policy_number, :emergency_number, :birthday_who_and_when, :anniversary_who_and_where, :emergency_contacts, :i_accept_name]

      alias_attribute :message, :address

      attr_accessible :full_name, :email, :telephone, :cellphone, :address, :insurance_company, :policy_number, :emergency_number, :birthday_who_and_when, :anniversary_who_and_where, :emergency_contacts, :i_accept_name


      alias_attribute :name, :full_name

      # Add some validation here if you want to validate the user's input
      # We have validated the first string field for you.
      validates :full_name, :presence => true
    end
  end
end
