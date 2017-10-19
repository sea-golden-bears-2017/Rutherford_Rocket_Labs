Rails.application.routes.draw do

  resources :employees, only: [:new, :create]

end
