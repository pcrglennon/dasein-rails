class StaticController < ApplicationController
  def home
    @posts = Post.paginate(:page => params[:page], :per_page => 4)
  end
end
