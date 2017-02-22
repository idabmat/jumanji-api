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

end