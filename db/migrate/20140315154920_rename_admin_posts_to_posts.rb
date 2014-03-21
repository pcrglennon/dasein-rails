class RenameAdminPostsToPosts < ActiveRecord::Migration
  def change
  	rename_table :admin_posts, :posts
  end
end
