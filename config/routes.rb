Rails.application.routes.draw do
  resources :employees, only: [:new, :create, :confirmation]
  resources :warehouses, only: [:new, :create, :confirmation]
  resources :parts, only: [:index, :create, :show, :new]
  resources :orders, only: [:index, :new, :create, :show, :confirmation]

  root to: 'homes#show'

  #homepage routes
  get "/home", to: "homes#show"

  # sessions routes
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  #warehouse routes
  get '/warehouse/:id/confirmation', to: 'warehouses#confirmation', as: 'confirmation'

  #employee routes
  get '/employees/:id/confirmation', to: 'employees#confirmation', as: 'confirm'

  #orders routes
  get '/order/:id/confirmation', to: 'orders#confirmation', as: 'affirm'
end
