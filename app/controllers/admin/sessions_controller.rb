class Admin::SessionsController < ApplicationController

  def new

  end

  def create
    admin = Admin.find_by(username: params[:session][:username].downcase)
    if admin && admin.authenticate(params[:session][:password])
      #Log In
      admin_log_in(admin)
      flash[:success] = "Welcome, #{admin.username}"
      redirect_to admin_path
    else
      flash.now[:error] = 'Invalid username/password combination'
      render 'new'
    end
  end

  def destroy
    admin_log_out
    redirect_to root_url
  end
end
