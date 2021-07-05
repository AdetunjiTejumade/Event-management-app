## uncomment when before_action :authenticate_user!
# require 'rails_helper'
# RSpec.describe 'Sessions' do
#   let(:user) { create(:user) }
#   it 'signs user in and out' do
#     sign_in user
#     get root_path
#     expect(response).to render_template(:index)
#
#     sign_out user
#     get root_path
#     expect(response).not_to render_template(:index)
#   end
# end

