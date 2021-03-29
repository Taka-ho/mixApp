class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :update, :create, :edit, :update, :destroy]
  before_action :find_post, only: [:edit, :update, :show, :destroy]

    def index
        @posts = Post.all
        @like = Like.new

      end

      def new
        @post = Post.new

      end

    def show
        @comment = Comment.new     
        @comments = @post.comments
    end
    
    
    def create
      @post = current_user
      @post = Post.create(post_params)
      if @post.save
        redirect_to root_path,notice:'投稿に成功しました'
        else
          redirect_to new_post_path,notice:'投稿に失敗しました'
        end
      end
    
      def edit
      end

      def update
        @post.update(post_params)
      end

      def destroy
        if @post.destroy
          redirect_to root_path,alert: '投稿を削除しました'
        else
          redirect_to root_path
        end
      end

      private

        def post_params
          params.require(:post).permit(:content, {images: []}).merge(user_id: current_user.id)
        end

        def find_post
          @post = Post.find(params[:id])
        end

        def force_redirect_unless_my_post
          return redirect_to root_path,alert:'権限がありません'if @post.user != current_user
        end
end
