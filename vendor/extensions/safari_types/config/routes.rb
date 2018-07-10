Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :safari_types do
    resources :safari_types, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :safari_types, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :safari_types, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
