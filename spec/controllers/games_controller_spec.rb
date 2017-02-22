require 'rails_helper'

RSpec.describe GamesController, type: :controller do

  describe "POST #create" do
    it "returns http success" do
      post :create
      expect(response).to have_http_status(:success)
    end

    it 'returns the game id' do
      post :create
      expect(JSON.parse(response.body)['data']['id']).to eq('2')
    end
  end

  describe "PUT #start" do
    let(:game) { create(:game) }

    context 'when there are not enough players' do
      it 'returns 422' do
        put :start, params: { id: game.id }
        expect(response).to have_http_status(422)
      end

      it 'returns a error message' do
        put :start, params: { id: game.id }
        expect(JSON.parse(response.body)['players'][0]).to \
          eq('Not enough players to start the game')
      end
    end

    context 'when there are enough players' do
      it 'returns 200' do
        create_list(:player, 2, game: game)
        put :start, params: { id: game.id }
        expect(response).to have_http_status(200)
      end
    end

    context 'when there are enough players' do
      it 'returns 200' do
        create_list(:player, 5, game: game)
        put :start, params: { id: game.id }
        expect(response).to have_http_status(422)
      end

      it 'returns a error message' do
        create_list(:player, 5, game: game)
        put :start, params: { id: game.id }
        expect(JSON.parse(response.body)['players'][0]).to \
          eq('Too many players to start the game')
      end
    end
  end
end
