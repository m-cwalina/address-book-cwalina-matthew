Rails.application.routes.draw do
  # Routes for authentication
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :users
  resources :sessions
  # Route to for home page
  root to: 'pages#home', as: :home
end
