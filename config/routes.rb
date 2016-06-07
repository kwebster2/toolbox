Rails.application.routes.draw do
  
  root 'home#index'

  # Login / Logout
  get '/auth/github/callback', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'

  # Nested Resources
  resources :cohorts, param: :slug do
    resources :categories, param: :slug 
  end

  # Shallow Resources
  resources :tags
  resources :resources
  resources :users

end
