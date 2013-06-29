class Admin::DashboardController < Admin::BaseController
  before_filter :authorize

  def index
  end
end
