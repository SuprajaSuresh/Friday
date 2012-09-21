class LikesController < ApplicationController
 
 def create
    @post = Post.find(params[:post_id])
    opts = {:user_id => current_user.id, :post_id => params[:post_id]}
    @like = @post.likes.create(opts)
    redirect_to user_path(current_user)
  end
end
