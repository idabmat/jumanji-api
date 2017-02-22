require 'rails_helper'

RSpec.describe PlayerPositionsController, type: :controller do

  describe "POST #update" do
    let(:player) { create(:player) }

    it "returns the updated player" do
      player.update(position: 3)
      post :update, params: { player_id: player.id.to_s, roll: '6' }
      expect(JSON.parse(response.body)['data']['attributes']['position']).to eq(9)
    end
  end

end
