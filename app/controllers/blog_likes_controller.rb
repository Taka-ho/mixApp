class BlogLikesController < ApplicationController
    before_action :blog_params

    def create
      BlogLike.create(user_id: current_user.id, blog_id: params[:id])
    end
  
    def destroy
      BlogLike.find_by(user_id: current_user.id, blog_id: params[:id]).destroy
    end
  
    def blog_params
      @blog = Blog.find(params[:id])
    end
end
