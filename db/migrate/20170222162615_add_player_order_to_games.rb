class AddPlayerOrderToGames < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :player_order, :integer, default: [], array: true
  end
end
