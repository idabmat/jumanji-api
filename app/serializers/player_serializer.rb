class PlayerSerializer < ActiveModel::Serializer
  attributes :id, :game_id, :position
end
