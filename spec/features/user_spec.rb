require 'rails_helper'

RSpec.feature "Users", type: :feature do

  describe 'sign_up process' do
    let(:first_name) { Faker::Name.name }
    let(:last_name) { Faker::Name.last_name }
    let(:email) { Faker::Internet.email }
    let(:password) { Faker::Internet.password(min_length: 8) }

    it 'should sign user up' do
      visit new_user_registration_path
      fill_in 'user[first_name]', with: first_name
      fill_in 'user[last_name]', with: last_name
      fill_in 'Email', with: email
      fill_in 'Password', with: password
      fill_in 'user[password_confirmation]', with: password

      click_on 'Sign up'

      expect(current_path).to eq(root_path)
      expect(page).to have_text('your events')
    end

    it 'should not sign user up with invalid data' do
      visit new_user_registration_path
      fill_in 'user[first_name]', with: first_name
      fill_in 'user[last_name]', with: last_name
      # fill_in 'Email', with: email
      fill_in 'Password', with: password
      fill_in 'user[password_confirmation]', with: password

      click_on 'Sign up'

      expect(page).to have_text('Email can\'t be blank')
    end
  end

  describe 'sign in process' do
    before :each do
      User.create(first_name: 'john', last_name: 'snow', email: 'john@gmail.com', password: 'password')
    end
    it 'should sign user in' do
      visit '/users/sign_in'
      fill_in 'Email', with: 'john@gmail.com'
      fill_in 'Password', with: 'password'

      click_on 'Log in'

      expect(current_path).to eq(root_path)
    end

  end
end
