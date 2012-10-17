class SessionsController < ApplicationController

  skip_before_filter :login_required
 
  def new
  end
 
  def create
  	user = User.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:session][:password])
    	sign_in user
    	redirect_to user_path(user)
      
    else 
      render 'new'
      flash[:error] = 'Invalid email/password combination'
    end
  end
  
  def destroy
    sign_out
    flash[:notice] = 'You have been logged out'
    redirect_to root_url
  end 
end
