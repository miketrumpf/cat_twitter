class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  protect_from_forgery with: :exception
  before_action :require_login!
  helper_method :current_patient

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end



  protected
  def require_login!
    unless current_user
      flash[:notice] = "Please log in"
      redirect_to sign_in_path
    end
  end

end
