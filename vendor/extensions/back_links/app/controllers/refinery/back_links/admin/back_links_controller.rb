module Refinery
  module BackLinks
    module Admin
      class BackLinksController < ::Refinery::AdminController

        crudify :'refinery/back_links/back_link',
                :title_attribute => 'old_link', :xhr_paging => true

      end
    end
  end
end
