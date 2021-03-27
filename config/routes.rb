Rails.application.routes.draw do
  devise_for :users

  resources :posts 
  post 'like/:id', to: 'likes#create', as: 'create_like'
  delete 'like/:id', to: 'likes#destroy', as: 'destroy_like'

  root 'posts#index'
end