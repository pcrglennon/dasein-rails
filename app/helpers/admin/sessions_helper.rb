module Admin::SessionsHelper

  def authorize
    redirect_to admin_login_url unless admin_logged_in?
  end

  def admin_log_in(admin)
    remember_token = Admin.new_remember_token
    cookies[:remember_token] = { value: remember_token, expires: 1.month.from_now.utc }
    admin.update_attribute(:remember_token, Admin.encrypt(remember_token))
    self.current_admin = admin
  end

  def admin_log_out
    self.current_admin = nil
    cookies.delete(:remember_token)
  end

  def admin_logged_in?
    !current_admin.nil?
  end

  def current_admin
    remember_token = Admin.encrypt(cookies[:remember_token])
    @current_admin ||= Admin.find_by(remember_token: remember_token)
  end

  def current_admin=(admin)
    @current_admin = admin
  end

end
