Rails.application.routes.draw do
  devise_for :users
  resources :posts
  resources :likes, only: [:create, :destroy]
  root 'home#top'
  resources :profiles, only:[:show, :edit, :new, :create, :update]
end
