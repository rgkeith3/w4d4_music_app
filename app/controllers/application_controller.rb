class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def logged_in?
    return true if current_user
    false
  end



  protected

  def login(user)
    user.reset_session_token!
    user.save
    session[:session_token] = user.session_token
  end
end
