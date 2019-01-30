module Refinery
  module Inquiries
    class Inquiry < Refinery::Core::BaseModel

      filters_spam :message_field => :message,
                   :email_field => :email,
                   :author_field => :name,
                   :other_fields => [:phone],
                   :extra_spam_words => %w()

      validates :name, :presence => true
      # validates :message, :presence => true
      validates :email, :format=> { :with =>  /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i }
      validates :phone, :presence => true

      acts_as_indexed :fields => [:name, :email, :message, :phone]

      default_scope :order => 'created_at DESC'

      attr_accessible :name, :phone, :message, :email, :service_name, :destination, :from, :first_trip, :budget, :captcha, :currency, :except_communication, :number_of_nights, :hear

      def self.latest(number = 7, include_spam = false)
        include_spam ? limit(number) : ham.limit(number)
      end

    end
  end
end