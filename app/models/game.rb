class Game < ApplicationRecord
  has_many :players, inverse_of: :game

  def can_start
    return true if players.size.in?((2..4).to_a)
    errors.add(:players, "Not enough players to start the game") if players.size < 2
    errors.add(:players, "Too many players to start the game") if players.size > 4
    false
  end
end
