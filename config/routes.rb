Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :faq do
    resources :faqs, :controller => "faq", :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :faq, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do

      resources :faqs, :controller => "faq", :path => 'faq', :except => :show do
        collection do
          get :uncategorized
          post :update_positions
        end
      end


      scope :path => 'faq' do
        resources :categories
      end

    end
  end

end
