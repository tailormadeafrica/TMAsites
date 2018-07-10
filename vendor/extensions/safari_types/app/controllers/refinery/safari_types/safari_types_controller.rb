module Refinery
  module SafariTypes
    class SafariTypesController < ::ApplicationController

      before_filter :find_all_safari_types
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @safari_type in the line below:
        present(@page)
      end

      def show
        @safari_type = SafariType.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @safari_type in the line below:
        present(@page)
      end

    protected

      def find_all_safari_types
        @safari_types = SafariType.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/safari_types").first
      end

    end
  end
end
