Dasein::Application.routes.draw do
  
  root 'static_pages#home'

  resources :players 

  namespace :admin do
    get '', to: 'dashboard#index', as: '/'
    resources :sessions, only: [:new, :create, :destroy]
    resources :posts

    match 'login', to: 'sessions#new', via: :get
    match 'logout', to: 'sessions#destroy', via: :delete
  end

end
