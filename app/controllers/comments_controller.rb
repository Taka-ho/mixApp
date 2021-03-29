before_action :set_post
before_action :authenticate_user!    

def create
  @comment = @post.comments.create(comment_params)
  if @comment.save
    redirect_to blog_path(@post) notice: 'コメントしました'
  else
    flash.now[:alert] = 'コメントに失敗しました'
    render post_path(@post)
  end
end

def destroy
  @comment = Comment.find(params[:id])
  if @comment.destroy
    redirect_to post_path(@post), notice: 'コメントを削除しました'
  else
    flash.now[:alert] = 'コメント削除に失敗しました'
    render post_path(@post)
  end
end

private
def set_post
  @post = Post.find(params[:post_id])
end

def comment_params
  params.required(:comment).permit(:comment_text).merge(user_id: current_user.id, post_id: params[:post_id])
end