class ApplicationController < ActionController::Base
  include Authentication
  helper_method :authenticated?

  def authenticated?
    session[:user_id].present?
  end
end
