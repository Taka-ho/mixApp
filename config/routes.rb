Rails.application.routes.draw do
  devise_for :users
  
  resources :blogs do
    resources :blog_comments, only: %i[create destroy]
  end
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

  post 'blog_like/:id', to: 'blog_likes#create', as: 'create_blog_like'
  delete 'blog_like/:id', to: 'blog_likes#destroy', as: 'destroy_blog_like'
  root 'posts#index'
end
