Rails.application.routes.draw do
  resources :posts
  get 'home/index'
  get 'image', to: 'image#index'
  root to: "home#index"
  post 'uploadfiles'=>'posts#upload'

  patch 'posts' => 'posts#update'
  patch 'uploadfiles'=>'posts#upload'

  get '/delete_file', controller: 'image', action: 'delete_file'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
