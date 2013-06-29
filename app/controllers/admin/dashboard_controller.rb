class Admin::DashboardController < ApplicationController

  def index
    if admin_logged_in?
      render 'index'
    else
      redirect_to admin_login_path
    end
  end
end
