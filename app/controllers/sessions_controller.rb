class SessionsController < ApplicationController
  skip_before_action :require_login!, :only => [:new, :create]

  ##login
  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render 'new'
    end
  end
  
  ##logout
  def destroy
    session[:user_id] = nil
    redirect_to sign_in_path
  end




end
