module Refinery
  module SafariTypes
    module Admin
      class SafariTypesController < ::Refinery::AdminController

        crudify :'refinery/safari_types/safari_type',
                :title_attribute => 'name', :xhr_paging => true

      end
    end
  end
end
