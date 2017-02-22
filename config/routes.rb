Rails.application.routes.draw do
  post 'games/create'
  post 'roll', to: 'player_positions#update'
  post 'users/create'
end
