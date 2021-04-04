class MovieCommentsController < ApplicationController
  before_action :authenticate_user!, only: %i[edit show destroy]
  before_action :movie_params, only: %i[create destroy]
  def create
    @movie = Movie.find(params[:movie_id])
    @movie_comment = @movie.movie_comments.new(comment_params)
    @movie_comment.user_id = current_user.id
    if @movie_comment.save
      redirect_to request.referer
    else
      @movie_comments = @movie.comments
      redirect_to new_post_path
    end
  end

  def destroy
    @movie = Movie.find(params[:movie_id])
    @movie_comment = MovieComment.find(params[:id])
    @movie_comment.destroy
    redirect_to request.referer
  end

  private

  def movie_params
    @movie = Movie.find(params[:movie_id])
  end

  def comment_params
    params.require(:movie_comment).permit(:movie_comment)
  end
end
