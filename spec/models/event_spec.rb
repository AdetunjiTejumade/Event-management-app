require 'rails_helper'

RSpec.describe Event, type: :model do
  let!(:user) { create(:user) }
  let!(:event) { create(:event, user_id: user.id) }
  describe 'creation' do
    it 'can be created' do
      expect(event).to be_valid
      expect(Event.count).to eq(1)
    end
  end
end
