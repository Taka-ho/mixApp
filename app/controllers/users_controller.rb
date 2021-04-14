class UsersController < ApplicationController
    before_action :authenticate_user!

  def show
    @user = User.find_by(id: params[:id])
    @posts = Post.where(user_id: @user.id)
    @movies = Movie.where(user_id: @user.id)
    @blogs = Blog.where(user_id: @user.id)


  end
end
