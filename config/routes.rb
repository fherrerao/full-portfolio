Rails.application.routes.draw do
  namespace :api, :defaults => { :format => :json } do
    namespace :v1 do
      resources :projects
    end
  end
  resources :projects
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "projects#index"
end
