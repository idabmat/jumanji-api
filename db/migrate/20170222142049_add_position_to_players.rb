class AddPositionToPlayers < ActiveRecord::Migration[5.0]
  def change
    add_column :players, :position, :integer, default: 0, null: false
  end
end
