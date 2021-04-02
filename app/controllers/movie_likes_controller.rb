class MovieLikesController < ApplicationController
  before_action :movie_params

  def create
    Movie_like.create(user_id: current_user.id, movie_id: params[:id])
    redirect_to movies_path
  end

  def destroy
    Movie_like.find_by(user_id: current_user.id, movie_id: params[:id]).destroy
    redirect_to movies_path
  end

  def movie_params
    @movie = Movie.find(params[:id])
  end
end
