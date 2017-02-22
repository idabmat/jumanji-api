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
end
