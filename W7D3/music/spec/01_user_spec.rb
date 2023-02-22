require 'rails_helper'

RSpec.describe 'the signup process', type: :system do
  before do
    driven_by(:rack_test)
  end

  it 'has a new user page' do
    visit new_user_url
    expect(page).to have_content 'Create Account'
  end

  describe 'signing up a user' do
    before do
      visit new_user_url
      fill_in 'E-mail', with: 'testing_email'
      fill_in 'Password', with: 'capybaras'
      click_on 'Create free account!'
    end

    it 'shows email on the homepage after signup' do
      expect(page).to have_content 'testing_email'
    end
  end
end

RSpec.describe User, type: :model do
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_length_of(:password). is_at_least(6) }
end