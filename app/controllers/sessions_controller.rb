class SessionsController < ApplicationController
  skip_before_action :require_login!, :only => [:new, :create]

  def new
  end

  def create
    binding.pry
    # @user = User.find_by_email(params[:login][:email])
    # if @user && @user.authenticate(params[:login][:password])
    #   session[:user_id] = @user.id
    #   redirect_to root_path
    # else
    #   render 'new'
    # end
  end

  def destroy
    session[:user_id] = nil
    redirect_to sign_in_path
  end


end
