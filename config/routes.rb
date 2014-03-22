Dasein::Application.routes.draw do
  
  root 'static_pages#home'

  resources :players, only: [:show, :index]
  resources :posts, only: [:show]

  namespace :admin do
    get '', to: 'dashboard#index', as: '/'
    resources :sessions, only: [:new, :create, :destroy]
    resources :players, except: [:show, :index]
    resources :posts, except: [:show]
    match 'login', to: 'sessions#new', via: :get
    match 'logout', to: 'sessions#destroy', via: :delete
  end

end
