class LikesController < ApplicationController

  before_filter :load_post
  before_filter :load_object, :only => [:destroy]

  def create
    opts = {:user_id => current_user.id, :post_id => params[:post_id]}
    @like = @post.likes.create(opts)

    respond_to do |format|
      if @like.save    
        format.html { redirect_to :back }    
      else
        format.html { redirect_to :back }
      end
    end
  end

  def destroy
    @like.destroy
    respond_to do |format|
      format.html { redirect_to :back }
    end
  end

  protected

  def load_post
    @post = Post.find(params[:post_id])
  end
  
  def load_object
    @like = (@post || load_post).likes.find(params[:id])
  end
end
  