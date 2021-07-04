require 'rails_helper'

RSpec.describe User, type: :model do
  # let(:user) { described_class.create(last_name: 'john', first_name: 'snow', password: 'some_password', email: 'john.snow@code.com') }
  let!(:user) { create(:user) }
  describe 'creation' do
    it 'can be created' do
      expect(user).to be_valid
      expect(User.count).to eq(1)
      # expect(User.email).to eq(user.email)
    end
  end
end
