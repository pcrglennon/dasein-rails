class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.integer :number
      t.string :height
      t.string :classyear
      t.string :hometown

      t.timestamps
    end
  end
end
