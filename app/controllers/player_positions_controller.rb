class PlayerPositionsController < ApplicationController
  def update
    player = Player.find(params[:player_id])
    player.rolls_a(params[:roll].to_i)
    player.game.end_of_turn
    render json: player
  end
end
