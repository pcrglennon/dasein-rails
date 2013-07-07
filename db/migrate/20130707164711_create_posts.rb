class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :content
      t.string :title
      t.integer :admin_id

      t.timestamps
    end
    add_index :posts, [:admin_id, :created_at]
  end
end
