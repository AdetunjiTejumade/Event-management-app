require 'rails_helper'
RSpec.describe "Events", type: :request do
  let(:user) { create(:user) }
  let(:event) { create(:event, user_id: user.id) }
  let(:event_id) { event.id }

  describe 'GET index' do
    it 'should exist and respond' do
      sign_in user
      get events_path
      expect(response).to have_http_status(:success)
    end

    let!(:events) { create_list(:event, 10, user_id: user.id) }
    it 'should work with many records' do
      get events_path
      expect(events.count).to eq(10)
    end
  end

  describe 'GET show' do
    it 'should exist and respond' do
      sign_in user
      get event_path(event_id)
      expect(response.status).to eq(200)
    end
  end

  describe 'GET edit' do
    it 'should exist and respond' do
      sign_in user
      get edit_event_path(event_id)
      expect(response.status).to eq(200)
    end
  end
  describe 'GET new' do
    it 'should exist and respond' do
      sign_in user
      get new_event_path
      expect(response.status).to eq(200)
    end
  end
  describe 'POST create' do
    before { new_event_path, params = { event: create(:event, user_id: user.id) } }
    it 'should exist and respond' do
      sign_in user
      expect(Event.count).to eq(1)
    end
  end

  describe 'PUT update' do
    it 'should modify a record' do
      sign_in user
      put event_path(event_id), params: { event: { name: 'new event' } }
      expect(Event.count).to eq(1)
      expect(Event.first.name).to eq('new event')
    end
  end

  describe 'DELETE destroy' do
    it 'should delete a record' do
      sign_in user
      delete event_path(event_id)
      expect(Event.count).to eq(0)
    end
  end

end