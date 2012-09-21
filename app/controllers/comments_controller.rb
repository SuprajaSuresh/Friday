class CommentsController < ApplicationController
 
  def create
    @post = Post.find(params[:post_id])
    opts = params[:comment].merge(:user_id => current_user.id)
    @comment = @post.comments.create(opts)
    redirect_to user_path(current_user)
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to :back
    flash[:notice] = "Comment deleted"
  end
end