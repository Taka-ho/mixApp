class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_post, only: [:edit, :update, :show, :destroy]

    def index
        @posts = Post.all
      end

      def new
      @post = Post.new
    end
    
    def edit
      @post = Post.find(post_params)
    end
    
    def create
      return redirect_to new_profile_path,alert: "プロフィールを登録してください" if current_user.profile.blank?
      @post = current_user
      @post = Post.create params.require(:post).permit(:content, images: []) 
      if @post.save
        redirect_to root_path,notice:'投稿に成功しました'
        else
          render :new
        end
      end
      
      def update
        if @post.update(post_params)
          redirect_to root_path
        else
          render :edit
        end
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
          params.require(:post).permit(:content, images: [])
        end

        def find_post
          @post = Post.find(params[:id])
        end

        def force_redirect_unless_my_post
          return redirect_to root_path,alert:'権限がありません'if @post.user != current_user
        end
end
