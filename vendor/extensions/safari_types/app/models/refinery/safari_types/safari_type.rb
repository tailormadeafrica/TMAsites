module Refinery
  module SafariTypes
    class SafariType < Refinery::Core::BaseModel
      self.table_name = 'refinery_safari_types'      
    
      acts_as_indexed :fields => [:name, :body]

      validates :name, :presence => true, :uniqueness => true

      attr_accessible :name, :image_id, :body, :position
          
      belongs_to :image, :class_name => '::Refinery::Image'
        
    end
  end
end
