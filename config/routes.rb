Rails.application.routes.draw do

  resources :employees, only: [:new, :create]
  resources :warehouses, only: [:new, :create]

  # sessions routes
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

end
