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
  get '/cohort/:cohort_slug/tags', to: 'tags#index', as: 'tags'
  resources :resources
  post 'resources/:id/bookmark', to: 'resources#bookmark', as: :bookmark
  resources :users, param: :user_name

end
