Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :teams do
    resources :teams, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :teams, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :teams, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
