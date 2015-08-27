Rails.application.routes.draw do
  resources :contacts, only: [:new, :create]
  resources :articles, only: [:index, :show]

  root to: "application#index"
  mount Optimadmin::Engine => "/admin"
end
Optimadmin::Engine.routes.draw do
  resources :articles, except: [:show] do
    collection do
      post 'order'
    end
    member do
      get 'toggle'
    end
  end
end