class PlayerPositionsController < ApplicationController
  def update
    player = Player.find(params[:player_id])
    player.rolls_a(params[:roll].to_i)
    render json: player
  end
end
