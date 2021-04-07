class MovieLikesController < ApplicationController
  before_action :movie_params

  def create
    MovieLike.create(user_id: current_user.id, movie_id: params[:id])
  end

  def destroy
    MovieLike.find_by(user_id: current_user.id, movie_id: params[:id]).destroy
  end

  def movie_params
    @movie = Movie.find(params[:id])
  end
end
