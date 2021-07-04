require 'rails_helper'

RSpec.describe Event, type: :model do
  let(:user) { create(:user) }
  let(:event) { create(:event, user_id: user.id) }

  describe 'creation' do
    it 'can be created' do
      expect(event).to be_valid
      expect(Event.count).to eq(1)
    end
  end

  context 'with no description' do

    it 'should not be created' do
      event.description = nil

      expect(event).to_not be_valid
      expect(event.errors[:description]).to include('can\'t be blank')
    end
  end

  context 'with no user' do

    it 'should not be created' do
      event.user_id = nil
      expect(event).to_not be_valid
    end
  end

  describe 'deletion' do
    it 'should delete' do
      event.destroy
      expect(Event.count).to eq(0)

    end

  end
end