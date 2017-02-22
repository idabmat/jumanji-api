class GamesController < ApplicationController
  def create
    game = Game.create
    render json: game
  end

  def start
    game = Game.includes(:players).find(params[:id])
    if game.start
      head :ok
    else
      render json: game.errors.messages, status: 422
    end
  end
end
