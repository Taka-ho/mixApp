Rails.application.routes.draw do
  devise_for :users
  resources :users
  root 'posts#index'

  resources :posts do
    resources :likes, only: [:create, :destroy]
  end
end
