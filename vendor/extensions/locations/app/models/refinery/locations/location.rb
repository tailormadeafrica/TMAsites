module Refinery
  module Locations
    class Location < Refinery::Core::BaseModel
      self.table_name = 'refinery_locations'      
    
      acts_as_indexed :fields => [:name, :description]

      validates :name, :presence => true, :uniqueness => true

      attr_accessible :name, :cover_image_id, :description, :position, :activity_ids, :gallery_id, :longitude, :latitude, :sub_name
          
      belongs_to :cover_image, :class_name => '::Refinery::Image'
      belongs_to :gallery, :class_name => '::Refinery::Portfolio::Gallery'
      has_many :accommodations, :class_name => '::Refinery::Accommodations::Accommodation'
      has_and_belongs_to_many :activities, :class_name => '::Refinery::Activities::Activity', :join_table => 'refinery_activities_locations'
      has_and_belongs_to_many :posts, :class_name => 'Refinery::Blog::Post', :join_table => 'refinery_locations_posts'
        
    end
  end
end
