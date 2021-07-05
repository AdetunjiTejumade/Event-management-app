require 'rails_helper'

RSpec.feature "Events", type: :feature do
  let(:user) { create(:user) }
  let(:event) { create(:event, user_id: user.id) }

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
  
  # describe 'creation' do
  #   sign_in user
  #
  # end
end
