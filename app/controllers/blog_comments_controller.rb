class BlogCommentsController < ApplicationController
    before_action :authenticate_user!, only: %i[edit show destroy]
    before_action :blog_params
    def create
      @blog_comment = @blog.blog_comment.new(blog_comment_params)
      @blog_comment.user_id = current_user.id
      if @blog_comment.save
        redirect_to request.referer
      else
        @blog_new = Blog.new
        @blog_comments = @blog.comments
        redirect_to new_blog_path
      end
    end
  
    def destroy
      @blog_comment = BlogComment.find(params[:id])
      @blog_comment.destroy
      redirect_to request.referer
    end
  
    private

    def blog_params
      @blog = Blog.find(params[:blog_id])

    end
  
    def blog_comment_params
      params.require(:blog).permit(:blog_comment)
    end
end