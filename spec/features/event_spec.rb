require 'rails_helper'

RSpec.feature "Events", type: :feature do
  let(:user) { create(:user) }
  let(:event) { create(:event, user_id: user.id) }
  let(:event_id) { event.id }

  describe 'index' do
    it 'should be reachable' do
      visit events_path
      expect(page.status_code).to eq(200)
    end

    it 'should have text Event platform' do
      visit events_path
      expect(page).to have_content(/Event platform/)
    end
  end

  describe 'creation' do
    before do
      sign_in user
      visit new_event_path
    end
    it 'has a new form that can be reached' do
      expect(page.status_code).to eq(200)
    end

    it 'can be created from a new form' do
      fill_in 'event[name]', with: 'Wedding party'
      fill_in 'event[description]', with: 'the wedding ceremony of John and Lucy'
      fill_in 'event[location]', with: 'sector 616'
      fill_in 'event[start_date]', with: '07/07/2021 19:12'
      fill_in 'event[end_date]', with: '05/07/2021 20:13'

      click_on 'create'
      expect(Event.count).to eq(1)
      expect(page).to have_text('Wedding party')
    end

    it 'should not create with invalid data' do
      fill_in 'event[location]', with: 'sector 616'
      fill_in 'event[start_date]', with: '07/07/2021 19:12'
      fill_in 'event[end_date]', with: '05/07/2021 20:13'

      click_on 'create'
      expect(page).to have_text('Name can\'t be blank')
    end


  end

  describe 'edit' do
    it 'should be editable' do
      sign_in user
      visit edit_event_path(event_id)

      fill_in 'event[name]', with: 'Edited event'
      click_on 'save'
      expect(page).to have_text('Edited event')
    end

    it 'can set event as inactive ' do
      sign_in user
      visit edit_event_path(event_id)

      page.check('event_in_active')

      click_on 'save'
      expect(page).to have_text('event is inactive')
    end
  end


  describe 'deletion' do
    it 'should be deletable' do
      sign_in user
      visit event_path(event_id)
      click_on 'Delete'
      expect(current_path).to eq(events_path)
      expect(Event.count).to eq(0)
    end
  end
end
