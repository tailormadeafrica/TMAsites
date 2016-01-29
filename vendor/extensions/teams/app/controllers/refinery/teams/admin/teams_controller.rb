module Refinery
  module Teams
    module Admin
      class TeamsController < ::Refinery::AdminController

        crudify :'refinery/teams/team',
                :title_attribute => 'name', :xhr_paging => true

      end
    end
  end
end
