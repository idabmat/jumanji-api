class Player < ApplicationRecord
  belongs_to :game, inverse_of: :players

  validates :name, presence: true
  validates :logins, presence: true, length: { minimum: 1}
end
