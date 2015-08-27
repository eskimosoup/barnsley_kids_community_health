Rails.application.routes.draw do

  resources :pages, only: :show
  resources :contacts, only: [:new, :create]
  resources :articles, only: [:index, :show]

  root to: "application#index"
  mount Optimadmin::Engine => "/admin"
end
Optimadmin::Engine.routes.draw do
  resources :services, except: [:show] do
    collection do
      post 'order'
    end
    member do
      get 'toggle'
    end
  end
  resources :pages, except: :show do
    collection do
      post 'order'
    end
    member do
      get 'edit_images'
      get 'toggle'
      get 'edit_images'
      post 'update_image_default'
      post 'update_image_fill'
      post 'update_image_fit'
    end
  end
  resources :articles, except: [:show] do
    collection do
      post 'order'
    end
    member do
      get 'toggle'
    end
  end
end