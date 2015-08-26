Rails.application.routes.draw do
  resources :contacts, only: [:new, :create]

  root to: "application#index"
  mount Optimadmin::Engine => "/admin"
end
Optimadmin::Engine.routes.draw do
end