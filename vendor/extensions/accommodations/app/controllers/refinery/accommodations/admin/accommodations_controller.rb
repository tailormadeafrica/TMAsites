module Refinery
  module Accommodations
    module Admin
      class AccommodationsController < ::Refinery::AdminController

        crudify :'refinery/accommodations/accommodation',
                :title_attribute => 'name', :xhr_paging => true

      end
    end
  end
end
