Rails.application.routes.draw do
  devise_for :users
  resources :posts
  root 'home#top'
  resources :profiles, only:[:show, :edit, :new, :create, :update]
end
