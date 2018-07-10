module Refinery
  module BackLinks
    class BackLink < Refinery::Core::BaseModel
      self.table_name = 'refinery_back_links'      
    
      acts_as_indexed :fields => [:old_link, :new_link]

      attr_accessible :old_link, :new_link, :position

      validates :old_link, :presence => true, :uniqueness => true

      validates :new_link, :presence => true
              
    end
  end
end
