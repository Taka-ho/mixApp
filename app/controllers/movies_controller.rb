class MoviesController < ApplicationController
  before_action :authenticate_user!, only: %i[new update create edit update destroy]
  before_action :find_movie, only: %i[edit update show destroy]

  def index
    @movies = Movie.includes(:user).order(id: 'DESC')
    @movie_like = MovieLike.new
  end

  def new
    @movie = Movie.new
  end

  def show
    @movie_comment = MovieComment.new
    @movie_comments = @movie.movie_comments.order(id: 'DESC')
  end

  def create
    @movie = current_user
    @movie = Movie.create(movie_params)
    if @movie.save
      redirect_to movies_path, notice: '投稿に成功しました'
    else
      redirect_to new_movie_path, notice: '投稿に失敗しました'
    end
  end

  def edit; end

  def update
    @movie.update(movie_params)
    redirect_to movies_path
  end

  def destroy
    if @movie.destroy
      redirect_to movies_path, alert: '投稿を削除しました'
    else
      redirect_to movies_path
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :introduction, :movie).merge(user_id: current_user.id)
  end

  def find_movie
    @movie = Movie.find(params[:id])
  end

  def force_redirect_unless_my_movie
    return redirect_to movies_path, alert: '権限がありません' if @movie.user != current_user
  end
end
