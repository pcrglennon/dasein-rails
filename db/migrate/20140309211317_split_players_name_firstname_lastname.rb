class SplitPlayersNameFirstnameLastname < ActiveRecord::Migration
  def change
  	remove_column :players, :name

  	add_column :players, :firstname, :string
  	add_column :players, :lastname, :string
  end
end
