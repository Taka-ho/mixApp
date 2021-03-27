class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to "/posts/#{@comment.comment_id}" }
      else
        format.html { render :new }
      end
    end
  end

  private

    def comment_params
      params.require(:comment).permit(:comment, :comment_id, :comment_id)
    end
end