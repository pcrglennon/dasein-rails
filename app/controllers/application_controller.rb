class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  include SessionsHelper

  def handle_unverified_request
    sign_out
    super
  end

  private

    def authorize
      redirect_to admin_login_path if current_admin.nil?
    end

end
