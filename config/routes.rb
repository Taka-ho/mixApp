Rails.application.routes.draw do
  resources :blogs
  devise_for :users
  resources :movies do
    resources :movie_comments, only: %i[create destroy]
  end
  resources :posts do
    resources :comments, only: %i[create destroy]
  end
  post 'like/:id', to: 'likes#create', as: 'create_like'
  delete 'like/:id', to: 'likes#destroy', as: 'destroy_like'

  post 'movie_like/:id', to: 'movie_likes#create', as: 'create_movie_like'
  delete 'movie_like/:id', to: 'movie_likes#destroy', as: 'destroy_movie_like'
  root 'posts#index'
end
