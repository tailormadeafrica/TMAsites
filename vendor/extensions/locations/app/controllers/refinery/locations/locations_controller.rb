module Refinery
  module Locations
    class LocationsController < ::ApplicationController

      before_filter :find_all_locations
      before_filter :find_page

      def index
        if params[:search].present?
          @all_locations = ::Refinery::Locations::Location.where("UPPER(description) LIKE '%#{params[:search].upcase}%' or UPPER(name) LIKE '%#{params[:search].upcase}%'")
          @all_accommodations = ::Refinery::Accommodations::Accommodation.where("UPPER(description) LIKE '%#{params[:search].upcase}%' or UPPER(name) LIKE '%#{params[:search].upcase}%'")
        end
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @location in the line below:
        present(@page)
      end

      def show

        if params[:third_child].present?
          @location = Location.find_by_slug(params[:third_child])
        elsif params[:second_child].present?
          @location = Location.find_by_slug(params[:second_child])
        elsif params[:first_child].present?
          @location = Location.find_by_slug(params[:first_child])
        else
          @location = Location.find_by_slug(params[:id])
          @parent = Location.find_by_slug(params[:id])
        end
        

        if !@location.present?
          redirect_to refinery.page_path(params[:id])
        elsif request.url.include? 'locations'
          if @location.parent.present? and @location.parent.parent.present?
            redirect_to refinery.locations_location_path(@location.parent.parent, @location.parent, @location), :status => :moved_permanently
          elsif @location.parent.present?
            redirect_to refinery.locations_location_path(@location.parent, @location), :status => :moved_permanently
          else
            redirect_to refinery.locations_location_path(@location), :status => :moved_permanently
          end
        else
          if @parent.present? and @parent.parent.present? and @parent.parent.parent.present?
            redirect_to refinery.locations_location_path(@location.parent.parent, @location.parent, @location), :status => :moved_permanently
          elsif @parent.present? and @parent.parent.present?
            redirect_to refinery.locations_location_path(@location.parent, @location), :status => :moved_permanently
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
