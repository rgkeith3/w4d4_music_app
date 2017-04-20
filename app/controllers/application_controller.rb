class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected
  
  def login
    session[:session_token] = @user.session_token
  end
end
