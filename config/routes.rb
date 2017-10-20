Rails.application.routes.draw do
  resources :employees, only: [:new, :create]
  resources :warehouses, only: [:new, :create, :confirmation]
  resources :parts, only: [:index, :show]

  root to: 'homes#show'

  #homepage routes
  get "/home", to: "homes#show"

  # sessions routes
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  #warehouse routes
  get '/warehouse/:id/confirmation', to: 'warehouses#confirmation', as: 'confirmation'
end
