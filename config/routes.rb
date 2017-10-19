Rails.application.routes.draw do

  resources :employees, only: [:new, :create]
  resources :warehouses, only: [:new, :create]

end
