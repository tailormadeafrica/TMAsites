Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :locations, :path => '' do
    # resources :locations, :path => '', :only => [:show]
    match '/:id(/:first_child)(/:second_child)(/:third_child)' => 'locations#show', via: :get, :as => :location
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
