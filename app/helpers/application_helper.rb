module ApplicationHelper
    # Giữ phương thức `authenticated?` trong helper nếu muốn
    def authenticated?
      session[:user_id].present?
    end
  end
  