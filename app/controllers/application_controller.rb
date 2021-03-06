class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user
  
  private
  
  def current_user
    @current_user ||= Admin::User.find(session[:user_id]) if session[:user_id]
  end

  def render_404
    raise ActionController::RoutingError.new('Not Found')
  end
end
