class StaticPagesController < ApplicationController
  def home
  	@posts = Post.order('created_at DESC').page(params[:page])
  end

  def help
  end
end
