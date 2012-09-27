class LikesController < ApplicationController
 
 def create
    @post = Post.find(params[:post_id])
    opts = {:user_id => current_user.id, :post_id => params[:post_id]}
    @like = @post.likes.create(opts)
    respond_to do |format|
     if @like.save    
        format.html { redirect_to @user }
        format.js { create.html.js }
      else
        format.html { redirect_to @user } 
        format.js { redirect_to @user }
    redirect_to :back 
  end
  def destroy
    like = Like.find(params[:id])
    like.destroy
    redirect_to :back
  end
end
