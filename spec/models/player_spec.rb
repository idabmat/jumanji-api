require 'rails_helper'

RSpec.describe Player, type: :model do
  describe 'db structure' do
    it { is_expected.to have_db_column(:name).of_type(:string) }
    it { is_expected.to have_db_column(:logins).of_type(:jsonb) }
    it { is_expected.to have_db_index(:logins) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:logins) }
    it { is_expected.to validate_length_of(:logins) }
  end
end
