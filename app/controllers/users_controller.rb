class UsersController < ApplicationController
    before_action :authenticate_user!

  def show
    @users = User.includes(:post, :movie, :blog)
    @user = User.find(params[:id])
    @post = Post.find(params[:id])
    @movie = Movie.find(params[:id])
    @blog = Blog.find(params[:id])

  end
end
