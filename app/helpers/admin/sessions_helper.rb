module Admin::SessionsHelper

  def authorize
    redirect_to admin_login_url unless admin_logged_in?
  end

  def admin_log_in(admin)
    session[:current_admin_id] = admin.id
    self.current_admin = admin
  end

  def admin_log_out
    session[:current_admin_id] = nil
  end

  def admin_logged_in?
    !current_admin.nil?
  end

  def current_admin
    @_current_admin ||= session[:current_admin_id] && Admin.find_by_id(session[:current_admin_id])
  end

  def current_admin=(admin)
    @current_admin = admin
  end

end
