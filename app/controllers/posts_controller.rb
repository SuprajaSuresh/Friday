class PostsController < ApplicationController
  
  def show
    @post = Post.find(params[:id])
    respond_to do |format|
    format.html
    end
  end
	
  def create
    @user = User.find(params[:user_id])
    @post = @user.posts.create(params[:post])
    respond_to do |format|
	    if @post.save    
      	format.html { redirect_to @user, notice: 'Post was successfully created.' }
    	else
    		format.html { redirect_to @user }
        flash[:error] = 'Post must have Content !! '
 	 		end
		end
	end
    
  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end
    
  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to :back
    flash[:notice] = "Post destroyed"
  end
  
end