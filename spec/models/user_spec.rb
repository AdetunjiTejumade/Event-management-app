require 'rails_helper'

RSpec.describe User, type: :model do
  # let(:user) { described_class.create(last_name: 'john', first_name: 'snow', password: 'some_password', email: 'john.snow@code.com') }
  let!(:user) { create(:user) }
  describe 'creation' do
    it 'can be created' do
      expect(user).to be_valid
      expect(User.count).to_not eq(0)
    end
  end
  # describe 'can update' do
  #   it 'can change the first_name' do
  #     put :update, params: { id: user.}
  #   end
  # end
end
