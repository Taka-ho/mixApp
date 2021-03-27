Rails.application.routes.draw do
  devise_for :users
  resources :posts
  resources :likes, only: [:create, :destroy]
  resources :comments, only: [:create]

  root 'posts#index'
end
  
