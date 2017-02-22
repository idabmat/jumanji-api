require 'rails_helper'

RSpec.describe Player, type: :model do
  describe 'db structure' do
    it { is_expected.to have_db_column(:name).of_type(:string) }
    it { is_expected.to have_db_column(:game_id).of_type(:integer) }
    it { is_expected.to have_db_column(:logins).of_type(:jsonb) }
    it { is_expected.to have_db_column(:position).of_type(:integer) }
    it { is_expected.to have_db_index(:game_id) }
    it { is_expected.to have_db_index(:logins) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:position) }
    it { is_expected.to validate_inclusion_of(:position).in_range(0..40) }
    it { is_expected.to validate_presence_of(:logins) }
    it { is_expected.to validate_length_of(:logins) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:game) }
  end
end
