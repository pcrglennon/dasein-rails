class Post < ActiveRecord::Base
	belongs_to :admin

	validates_presence_of :admin_id, :title, :content

	self.per_page = 8
end
