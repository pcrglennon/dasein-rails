class Admin::PostsController < PostsController

	before_filter :signed_in_admin

	def index
		@posts = Post.all
	end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.admin = current_admin
    if @post.save
      flash[:notice] = "Post '" + @post.title + "' successfully created."
      redirect_to admin_posts_path
    else
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      flash[:notice] = "Post '" + @post.title + "' updated."
      redirect_to admin_posts_path      
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "Post '" + @post.title+ "' deleted."
    redirect_to admin_posts_path
  end

  private

    def post_params
      params.require(:post).permit(:title, :content)
    end

    def signed_in_admin
      unless admin_logged_in?
        store_location
        redirect_to admin_login_url
      end
    end

end