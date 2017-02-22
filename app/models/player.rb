class Player < ApplicationRecord
  belongs_to :game, inverse_of: :players

  validates :name, presence: true
  validates :logins, presence: true, length: { minimum: 1}
  validates :position, presence: true, inclusion: { in: 0..40 }

  def rolls_a(integer)
    new_position = position + integer
    update(position: new_position) if integer.in?((1..8).to_a) && new_position < 41
  end
end
