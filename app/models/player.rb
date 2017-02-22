class Player < ApplicationRecord
  validates :name, presence: true
  validates :logins, presence: true, length: { minimum: 1}
end
