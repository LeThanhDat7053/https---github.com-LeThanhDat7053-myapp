class SessionsController < ApplicationController
  before_action :require_login, only: [:destroy]  # Đảm bảo chỉ người đã đăng nhập mới có thể đăng xuất

  def new
  end

  def create
    user = User.authenticate_by(params[:email_address], params[:password])
    
    if user
      session[:user_id] = user.id  # Lưu user vào session
      redirect_to root_path, notice: "Logged in successfully."
    else
      redirect_to new_session_path, alert: "Invalid email or password."
    end
  end

  def destroy
    session[:user_id] = nil  # Hủy session khi đăng xuất
    redirect_to root_path, notice: "Logged out successfully."
  end

  private

  def require_login
    unless session[:user_id].present?
      redirect_to new_session_path, alert: "You must be logged in to log out."
    end
  end

  def start_new_session_for(user)
    user.sessions.create!(user_agent: request.user_agent, ip_address: request.remote_ip).tap do |session|
      Current.session = session
      cookies.signed.permanent[:session_id] = { value: session.id, httponly: true, same_site: :lax }
    end
  end
end
