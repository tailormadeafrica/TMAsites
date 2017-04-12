module Refinery
  module Bookings
    class BookingsController < ::ApplicationController

      before_filter :find_page, :only => [:create, :new]

      def index
        redirect_to :action => "new"
      end

      def thank_you
        @page = Refinery::Page.find_by_link_url("/bookings/thank_you", :include => [:parts])
      end

      def new
        @booking = Booking.new
        # 1.times { @booking.passports.build }
        # 1.times { @booking.flights.build }
      end

      def create
        @booking = Booking.new(params[:booking])

        if @booking.save

          render :pdf => "cover.pdf",
                 :layout => false,
                 :template => 'refinery/bookings/bookings/template',
                 :page_size => 'A4',
                 margin:  { top: 0, bottom: 0, left: 0, right: 0 },
                 :save_to_file => Rails.root.join('tmp', "cover.pdf"),
                 :show_as_html => false, :dpi => '300', :save_only => true


          begin
            Mailer.notification(@booking, request).deliver
          rescue => e
            logger.warn "There was an error delivering the booking notification.\n#{e.message}\n"
          end

          if Booking.column_names.map(&:to_s).include?('email')
            begin
              Mailer.confirmation(@booking, request).deliver
            rescue => e
              logger.warn "There was an error delivering the booking confirmation:\n#{e.message}\n"
            end
          else
            logger.warn "Please add an 'email' field to Booking if you wish to send confirmation emails when forms are submitted."
          end

          redirect_to refinery.thank_you_bookings_bookings_path
        else
          render :action => 'new'
        end
      end


    protected

      def find_page
        @page = Refinery::Page.find_by_link_url('/bookings/new', :include => [:parts])
      end

    end
  end
end
