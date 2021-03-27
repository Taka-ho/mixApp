Rails.application.routes.draw do
  devise_for :users

  resources :posts do
    resources :likes, only: [:new, :create, :destroy]
  end


  root 'posts#index'
end
  
