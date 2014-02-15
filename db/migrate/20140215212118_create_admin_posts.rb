class CreateAdminPosts < ActiveRecord::Migration
  def change
    create_table :admin_posts do |t|
      t.string :title
      t.integer :admin_id
      t.string :content

      t.timestamps
    end
  end
end
