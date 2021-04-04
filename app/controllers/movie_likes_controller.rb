class MovieLikesController < ApplicationController
  before_action :movie_params

  def create
    MovieLike.create(user_id: current_user.id, movie_id: params[:id])
    redirect_to destroy_movie_like_path
  end

  def destroy
    MovieLike.find_by(user_id: current_user.id, movie_id: params[:id]).destroy
    redirect_to create_movie_like_path
  end

  def movie_params
    @movie = Movie.find(params[:id])
  end
end
