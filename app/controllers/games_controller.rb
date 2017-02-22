class GamesController < ApplicationController
  def create
    game = Game.create
    render json: game
  end
end
