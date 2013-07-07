class Post < ActiveRecord::Base
  belongs_to :admin

  default_scope -> { order('created_at DESC') }

  validates_presence_of :content, :title, :admin_id

end
