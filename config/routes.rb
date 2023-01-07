Rails.application.routes.draw do
  # Routes for authentication
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  # Routes for sessions
  resources :users, only: %i[new index]
  resources :sessions, only: %i[new create destroy]

  # Root route for home page
  root to: 'pages#home', as: :home

  # Route for people controller
  resources :people, only: %i[index edit show]

  # Routes for api people controller
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :people, only: %i[index create show edit destroy update]
    end
  end
end
