Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :back_links do
    resources :back_links, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :back_links, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :back_links, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
