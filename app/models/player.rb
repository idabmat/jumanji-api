class Player < ApplicationRecord
  belongs_to :game, inverse_of: :players

  validates :name, presence: true
  validates :logins, presence: true, length: { minimum: 1}
  validates :position, presence: true, inclusion: { in: 0..40 }
end
