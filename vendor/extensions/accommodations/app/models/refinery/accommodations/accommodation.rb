module Refinery
  module Accommodations
    class Accommodation < Refinery::Core::BaseModel
      self.table_name = 'refinery_accommodations'      
    
      acts_as_indexed :fields => [:name, :rating, :description]

      attr_accessible :name, :cover_image_id, :rating, :description, :position, :activity_ids, :location_id, :latitude, :longitude, :address, :gallery_id

      validates :name, :presence => true, :uniqueness => true
          
      belongs_to :cover_image, :class_name => '::Refinery::Image'
      belongs_to :gallery, :class_name => '::Refinery::Portfolio::Gallery'
      belongs_to :location, :class_name => '::Refinery::Locations::Location'
      has_and_belongs_to_many :activities, :class_name => '::Refinery::Activities::Activity', :join_table => 'refinery_activities_accommodations'
      has_and_belongs_to_many :posts, :class_name => 'Refinery::Blog::Post', :join_table => 'refinery_accommodations_posts'
        
    end
  end
end
