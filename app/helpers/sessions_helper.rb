module SessionsHelper

  def admin_log_in(admin)
    cookies[:remember_token] = { value: admin.remember_token, expires: 1.month.from_now.utc }
    self.current_admin = admin
  end

  def admin_log_out
    self.current_admin = nil
    cookies.delete(:remember_token)
  end

  def admin_logged_in?
    !current_admin.nil?
  end

  def current_admin=(admin)
    @current_admin = admin
  end

  def current_admin
    @current_admin ||= Admin.find_by_remember_token(cookies[:remember_token])
  end

  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end

  def store_location
    session[:return_to] = request.url
  end

end
