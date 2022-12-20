Rails.application.routes.draw do
  # Routes for authentication
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :users, only: %i[ new index ]
  resources :sessions, only: %i[new create destroy]

  # Root route for home page
  root to: 'pages#home', as: :home

  resources :people, only: %i[ index ]
end
