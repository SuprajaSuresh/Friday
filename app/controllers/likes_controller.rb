class LikesController < ApplicationController
 def create
    @post = Post.find(params[:post_id])
    @like = @post.likes.create(params[:like])
    redirect_to post_path(@post)
  end
end
