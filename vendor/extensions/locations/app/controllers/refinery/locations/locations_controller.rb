module Refinery
  module Locations
    class LocationsController < ::ApplicationController

      before_filter :find_all_locations
      before_filter :find_page

      def index
        if params[:search].present?
          @all_locations = ::Refinery::Locations::Location.where("COALESCE(exclusion, '') NOT iLIKE :search AND (description iLIKE :search OR name iLIKE :search OR inclusion iLIKE :search)", search: "%#{params[:search]}%")
          @all_accommodations = ::Refinery::Accommodations::Accommodation.where("COALESCE(exclusion, '') NOT iLIKE :search AND (description iLIKE :search OR name iLIKE :search OR inclusion iLIKE :search)", search: "%#{params[:search]}%")
        end
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @location in the line below:
        present(@page)
      end

      def show
        if params[:id].present?
           @location = Location.find_by_slug(params[:id])         
        else
          @location = Location.find_by_slug(request.path.split('/').last)
        end

        if @location.present? and params[:id].present?
          if @location.parent.present? and @location.parent.parent.present? 
            redirect_to "/#{@location.parent.parent.slug}/#{@location.parent.slug}/#{@location.slug}", :status => :moved_permanently 
          elsif @location.parent.present? 
            redirect_to  "/#{@location.parent.slug}/#{@location.slug}", :status => :moved_permanently 
          else 
            redirect_to "/#{@location.slug}", :status => :moved_permanently 
          end 
        end
        

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @location in the line below:
        present(@page)
      end

    protected

      def find_all_locations
        @locations = Location.where("parent_id IS NULL").order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/locations").first
      end

    end
  end
end
