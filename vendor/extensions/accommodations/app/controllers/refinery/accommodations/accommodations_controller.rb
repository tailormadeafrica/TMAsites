module Refinery
  module Accommodations
    class AccommodationsController < ::ApplicationController

      before_filter :find_all_accommodations
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @accommodation in the line below:
        present(@page)
      end

      def show
        if params[:id].present?
          @accommodation = Accommodation.find_by_slug(params[:id])         
        else
          @accommodation = Accommodation.find_by_slug(request.path.split('/').last)
        end
        location = @accommodation.locations.first

        if location.present? and request.path.include? 'accommodations'
          if location.parent.present? and location.parent.parent.present? 
            redirect_to "/#{location.parent.parent.slug}/#{location.parent.slug}/#{location.slug}/#{@accommodation.slug}", :status => :moved_permanently 
          elsif location.parent.present? 
            redirect_to  "/#{location.parent.slug}/#{location.slug}/#{@accommodation.slug}", :status => :moved_permanently 
          else 
            redirect_to "/#{location.slug}/#{@accommodation.slug}", :status => :moved_permanently 
          end 
        end

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @accommodation in the line below:
        present(@page)
       
      end

    protected

      def find_all_accommodations
        @accommodations = Accommodation.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/accommodations").first
      end

    end
  end
end
