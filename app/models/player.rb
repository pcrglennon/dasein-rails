class Player < ActiveRecord::Base

	validates_presence_of :firstname, :lastname, :classyear, :height, :hometown
	validates :number, presence: true, numericality: { only_integer: true }

	def fullname
		return "#{firstname} #{lastname}"
	end

	def name_with_nickname
		if nickname.empty?
			return fullname
		else
			return "#{firstname} \"#{nickname}\" #{lastname}"
		end
	end

	def self.classyear_list
		['Freshman', 'Sophomore', 'Junior', 'Senior']
	end

end
