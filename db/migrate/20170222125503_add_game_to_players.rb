class AddGameToPlayers < ActiveRecord::Migration[5.0]
  def change
    add_reference :players, :game, foreign_key: true, null: false, index: true
  end
end
