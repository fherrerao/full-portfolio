require 'rails_helper'

RSpec.describe 'Login', type: :system do
  before :all do
    User.destroy_all
    @user = User.new(email: 'abc@abc.com', password: '123456', role: 'admin')
    @user.skip_confirmation!
    @user.save!
  end

  describe 'testing sign in' do
    before :each do
      visit projects_path
    end

    it 'should be able to sign in' do
      expect(page).to have_content('Sign up')
    end

    it 'entering data in the form' do
      fill_in "user_email",	with: "abc@abc.com" 
      fill_in 'user_password',with: '123456'
      click_button 'Log in'
      expect(page).to have_content('Signed in successfully.')
    end
  end

end
