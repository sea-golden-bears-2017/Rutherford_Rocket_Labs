Rails.application.routes.draw do
  resources :employees, only: [:index, :new, :create]

  get "/home", :to => "homes#home"

end
