class HomeController < ApplicationController
  def top
    @posts = Post.all.order(id: "DESC")
  end
end
