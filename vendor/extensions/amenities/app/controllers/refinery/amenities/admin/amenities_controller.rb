module Refinery
  module Amenities
    module Admin
      class AmenitiesController < ::Refinery::AdminController

        crudify :'refinery/amenities/amenity',
                :title_attribute => 'name', :xhr_paging => true

      end
    end
  end
end
