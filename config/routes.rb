Rails.application.routes.draw do
  post 'users/create'
  post 'roll', to: 'player_positions#update'

  post 'games/create'
  put 'games/:id/start', to: 'games#start'
  patch 'games/:id/start', to: 'games#start'
end
