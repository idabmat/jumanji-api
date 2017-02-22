class Game < ApplicationRecord
  has_many :players, inverse_of: :game

  def start
    if can_start
      player_order = player_ids.shuffle
      update(
        player_order: player_order,
        current_player_id: player_order.first,
        started_on: Time.zone.now
      )
    end
  end

  def can_start
    return true if players.size.in?((2..4).to_a)
    errors.add(:players, 'Not enough players to start the game') if players.size < 2
    errors.add(:players, 'Too many players to start the game') if players.size > 4
    false
  end

  def current_player
    players.find(current_player_id)
  end

  def next_player
    current_index = player_order.index(current_player_id)
    new_index = (current_index + 1) % player_order.length
    players.find(player_order[new_index])
  end

  def end_of_turn
    update(current_player_id: next_player.id)
  end
end
