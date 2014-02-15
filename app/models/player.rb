class Player < ActiveRecord::Base

	validates_presence_of :name, :classyear, :height, :hometown
	validates :number, presence: true, numericality: { only_integer: true }

end
