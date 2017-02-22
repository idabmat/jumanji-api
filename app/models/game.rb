class Game < ApplicationRecord
  has_many :players, inverse_of: :game
end
