class LikesController < ApplicationController
 def create
    @post = Post.find(params[:post_id])
    opts = params[:like].merge(:user_id => current_user.id)
    @like = @post.likes.create(opts)
    redirect_to post_path(@post)
  end
end
