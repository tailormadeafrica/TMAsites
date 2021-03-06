module Refinery
  module Newsletter
    class Comment < ActiveRecord::Base

      attr_accessible :name, :email, :message, :captcha

      filters_spam :author_field => :name,
                   :email_field => :email,
                   :message_field => :body

      belongs_to :post, :foreign_key => 'newsletter_post_id'

      acts_as_indexed :fields => [:name, :email, :message]

      alias_attribute :message, :body

      validates :name, :message, :presence => true
      validates :email, :format => { :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i }

      attr_accessor :captcha
      validates :captcha, :presence => true, inclusion: { in: %w(y4x3b Y4X3B y4x3B), :message => 'Invalid Captcha' }

      class << self
        def unmoderated
          where(:state => nil)
        end

        def approved
          where(:state => 'approved')
        end

        def rejected
          where(:state => 'rejected')
        end
      end

      self.per_page = Refinery::Newsletter.comments_per_page

      def avatar_url(options = {})
        options = {:size => 60}
        require 'digest/md5'
        size = ("?s=#{options[:size]}" if options[:size])
        "http://gravatar.com/avatar/#{Digest::MD5.hexdigest(self.email.to_s.strip.downcase)}#{size}.jpg"
      end

      def approve!
        self.update_column(:state, 'approved')
      end

      def reject!
        self.update_column(:state, 'rejected')
      end

      def rejected?
        self.state == 'rejected'
      end

      def approved?
        self.state == 'approved'
      end

      def unmoderated?
        self.state.nil?
      end

      def self.toggle!
        currently = Refinery::Setting.find_or_set(:comments_allowed, true, {
          :scoping => 'newsletter'
        })
        Refinery::Setting.set(:comments_allowed, {:value => !currently, :scoping => 'newsletter'})
      end

      before_create do |comment|
        unless Moderation.enabled?
          comment.state = comment.ham? ? 'approved' : 'rejected'
        end
      end

      module Moderation
        class << self
          def enabled?
            Refinery::Setting.find_or_set(:comment_moderation, true, {
              :scoping => 'newsletter',
              :restricted => false
            })
          end

          def toggle!
            new_value = {
              :value => !Newsletter::Comment::Moderation.enabled?,
              :scoping => 'newsletter',
              :restricted => false
            }
            Refinery::Setting.set(:comment_moderation, new_value)
          end
        end
      end

      module Notification
        class << self
          def recipients
            Refinery::Setting.find_or_set(:comment_notification_recipients, (Refinery::Role[:refinery].users.first.email rescue ''),
            {
              :scoping => 'newsletter',
              :restricted => false
            })
          end

          def recipients=(emails)
            new_value = {
              :value => emails,
              :scoping => 'newsletter',
              :restricted => false
            }
            Refinery::Setting.set(:comment_notification_recipients, new_value)
          end

          def subject
            Refinery::Setting.find_or_set(:comment_notification_subject, "New inquiry from your website", {
              :scoping => 'newsletter',
              :restricted => false
            })
          end

          def subject=(subject_line)
            new_value = {
              :value => subject_line,
              :scoping => 'newsletter',
              :restricted => false
            }
            Refinery::Setting.set(:comment_notification_subject, new_value)
          end
        end
      end

    end
  end
end
