Refinery::Core::Engine.routes.append do

  # Frontend routes
  Refinery::Locations::Location.roots.each do |parent|
    match "/#{parent.slug}" => "locations/locations#show"
      if parent.accommodations.present?
        parent.accommodations.each do |acc|
          match "/#{parent.slug}/#{acc.slug}" => "accommodations/accommodations#show"
        end
      end
      parent.children.each do |child|
        match "/#{parent.slug}/#{child.slug}" => "locations/locations#show"
        if child.accommodations.present?
          child.accommodations.each do |acc|
            match "/#{parent.slug}/#{child.slug}/#{acc.slug}" => "accommodations/accommodations#show"
          end
        end
        child.children.each do |grand|
         match "/#{parent.slug}/#{child.slug}/#{grand.slug}" => "locations/locations#show"

          if grand.accommodations.present?
            grand.accommodations.each do |acc|
              match "/#{parent.slug}/#{child.slug}/#{grand.slug}/#{acc.slug}" => "accommodations/accommodations#show"
            end
          end
        end
    end
  end if ActiveRecord::Base.connection.table_exists? 'refinery_locations'

  namespace :locations do
    resources :locations, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :locations, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :locations, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
