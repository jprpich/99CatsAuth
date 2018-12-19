class SessionsController < ApplicationController
  before_action :ensure_logged_in, except: [:destroy]

  def new
    render :new
  end

  def create
    username = params[:user][:user_name]
    password = params[:user][:password]
    @user = User.find_by_credentials(username, password)
    if @user 
      login_user!(@user)
      redirect_to cats_url
    else
      flash.now[:errors] = ["Invalid Password"]
      render :new 
    end
  end

  def destroy
    logout_user!
    redirect_to new_session_url 
  end
end