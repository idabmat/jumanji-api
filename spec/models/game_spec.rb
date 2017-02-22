require 'rails_helper'

RSpec.describe Game, type: :model do
  describe 'db structure' do
    it { is_expected.to have_db_column(:started_on).of_type(:datetime) }
    it { is_expected.to have_db_column(:ended_on).of_type(:datetime) }
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
  end
end
