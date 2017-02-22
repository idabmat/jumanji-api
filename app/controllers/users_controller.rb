class UsersController < ApplicationController
  def create
    @player = Player.new(user_params)
    if @player.save
      render json: @player
    else
      render json: @player.errors.messages, status: 422
    end
  end

  protected

  def user_params
    params.permit(:name, :game_id, logins: [:facebook_token, :phone, :twitter_token])
  end
end
