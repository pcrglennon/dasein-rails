class Admin::SessionsController < ApplicationController

  def new

  end

  def create
    admin = Admin.find_by_username(params[:session][:username].downcase)
    if (admin && admin.authenticate(params[:session][:password]))
      admin_log_in admin
      redirect_back_or admin_path
    else
      flash.now[:error] = 'Invalid username/password'
      render 'new'
    end
  end

  def destroy
    admin_log_out
    redirect_to root_path
  end

end
