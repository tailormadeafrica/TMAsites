Refinery::Core::Engine.routes.append do

  # Frontend routes
  Refinery::Locations::Location.roots.each do |parent|
    match "/#{parent.slug}" => "locations/locations#show" 
    parent.children.each do |child|
      match "/#{parent.slug}/#{child.slug}" => "locations/locations#show" 
      child.children.each do |grand|
      match "/#{parent.slug}/#{child.slug}/#{grand.slug}" => "locations/locations#show" 
    end
    end
  end

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
