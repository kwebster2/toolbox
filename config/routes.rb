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
  resources :resources, only: [:new]
  post 'resources/:id/bookmark', to: 'resources#bookmark', as: :bookmark
  resources :users, param: :user_name

end
