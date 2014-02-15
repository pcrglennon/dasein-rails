Dasein::Application.routes.draw do
  
  root 'static_pages#home'

  resources :players 

  namespace :admin do
    get '', to: 'dashboard#index', as: '/'
    resources :posts
    resources :players

  end

end
