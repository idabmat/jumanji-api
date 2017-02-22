class UsersController < ApplicationController
  def create
    @player = Player.create(user_params)
    render json: @player
  end

  protected

  def user_params
    params.permit(:name, logins: [:facebook_token, :phone, :twitter_token])
  end
end
