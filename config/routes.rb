Rails.application.routes.draw do
  devise_for :users
  resources :posts
  root 'home#top'
  resources :profiles, only:[:show, :edit, :new, :create, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
