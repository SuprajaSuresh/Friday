class UsersController < ApplicationController
  skip_before_filter :login_required, :except => [:index]
  
  def index
    @users = User.all

    respond_to do |format|
      format.html 
    end
  end
  def show
    @user = User.find(params[:id])
    render "show"
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        #raise @user.inspect
        format.html { redirect_to @user, notice: 'Profile updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end
  def create
    @user = User.new(params[:user])
      if @user.save
        flash[:success] = "Welcome!"
        UserMailer.welcome_email(@user).deliver
        redirect_to signin_path
      else
        render  'new'  
      end
  end
 end
