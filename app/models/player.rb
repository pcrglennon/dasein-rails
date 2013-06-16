class Player < ActiveRecord::Base

  validates_presence_of :name, :class_year, :number, :height, :hometown
  validates :number, :uniqueness => {:message => '-> has already been taken'}

  def class_year_list
    {Freshman: 'Freshman', Sophomore: 'Sophomore', Junior: 'Junior', Senior: 'Senior'}
  end
end
