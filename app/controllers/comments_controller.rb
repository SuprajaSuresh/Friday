class CommentsController < ApplicationController
 def create
    @post = Post.find(params[:post_id])
    opts = params[:comment].merge(:user_id => current_user.id)
    @comment = @post.comments.create(opts)
    #redirect_to post_path(@post)
	if @comment.save
        redirect_to user_path (opts)
        flash.now[:notice] = 'Comment created'
    else
    	redirect_to user_path(opts)
 	 end
  end
end