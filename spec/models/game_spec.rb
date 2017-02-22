require 'rails_helper'

RSpec.describe Game, type: :model do
  describe 'db structure' do
    it { is_expected.to have_db_column(:started_on).of_type(:datetime) }
    it { is_expected.to have_db_column(:ended_on).of_type(:datetime) }
    it { is_expected.to have_db_column(:current_player_id).of_type(:integer) }
    it { is_expected.to have_db_column(:player_order).of_type(:integer) }
  end

  describe 'validations' do
  end

  describe 'associations' do
    it { is_expected.to have_many(:players) }
  end

  describe 'instance methods' do
    let(:game) { create(:game) }

    context 'can_start' do
      it 'returns false if the game has no players' do
        expect(game.can_start).to be_falsey
      end

      it 'returns false if the game has 1 player' do
        create(:player, game: game)
        expect(game.can_start).to be_falsey
      end

      it 'returns true if the game has 2 players' do
        create_list(:player, 2, game: game)
        expect(game.can_start).to be_truthy
      end

      it 'returns false if the game has 5 players' do
        create_list(:player, 5, game: game)
        expect(game.can_start).to be_falsey
      end
    end

    context 'start' do
      before { create_list(:player, 2, game: game) }

      it 'sets a current player' do
        game.start
        expect(game.current_player_id).not_to be_nil
      end

      it 'sets started_on' do
        game.start
        expect(game.started_on).not_to be_nil
      end

      it 'sets the order of players' do
        game.start
        expect(game.player_order).not_to be_empty
      end
    end

    context 'get players' do
      let!(:player1) { create(:player, game: game) }
      let!(:player2) { create(:player, game: game) }

      it 'returns current player' do
        game.start
        game.update(current_player_id: player1.id)
        expect(game.current_player).to eq(player1)
      end

      it 'returns the next player' do
        game.start
        game.update(current_player_id: player1.id)
        expect(game.next_player).to eq(player2)
      end
    end

    context 'end_of_turn' do
      let!(:player1) { create(:player, game: game) }
      let!(:player2) { create(:player, game: game) }

      it 'changes the current_player' do
        game.start
        game.update(current_player_id: player1.id)
        game.end_of_turn
        expect(game.current_player).to eq(player2)
      end
    end
  end
end
