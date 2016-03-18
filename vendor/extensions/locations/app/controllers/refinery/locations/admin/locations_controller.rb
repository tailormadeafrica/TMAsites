module Refinery
  module Locations
    module Admin
      class LocationsController < ::Refinery::AdminController

        crudify :'refinery/locations/location',
                :title_attribute => 'name', :xhr_paging => true, :order => "lft", :per_page => 1000

      end
    end
  end
end
