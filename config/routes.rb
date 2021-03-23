Rails.application.routes.draw do
  devise_for :users
  resources :posts
  resources :likes, only: [:create, :destroy]

  root 'posts#index'
end
