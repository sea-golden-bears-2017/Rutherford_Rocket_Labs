Rails.application.routes.draw do
  resources :employees, only: [:index, :new, :create]

  get "/home", :to => "homes#home"

  # sessions routes
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

end
