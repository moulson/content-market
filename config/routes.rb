Rails.application.routes.draw do
  get 'errors/not_found'

  get 'errors/internal_server_error'

  get 'sessions/new'

  resources :users
  resources :posts
  resources :users
  resources :sessions

  get 'contact', to: 'home#send_mail', as: 'contact'
  get 'cm-admin', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'home/index'
  get 'image', to: 'image#index'
  root to: "home#index"
  post 'uploadfiles'=>'posts#upload'

  patch 'posts' => 'posts#update'
  patch 'uploadfiles'=>'posts#upload'

  get '/delete_file', controller: 'image', action: 'delete_file'

  match "/404", :to => "errors#not_found", :via => :all
  match "/500", :to => "errors#internal_server_error", :via => :all

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
