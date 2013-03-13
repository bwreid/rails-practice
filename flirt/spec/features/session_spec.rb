require 'spec_helper'

describe 'Session' do # THIS IS LIKE THE SUBSCRIBERS CONTROLLER
  describe 'GET /' do # THESE ARE THE 'VERBS' WE'RE TRYING OUT
    it 'displays login link on the root path' do
      visit root_path
      page.should have_link('Login')
    end
  end

  describe 'GET /login' do
    it 'displays the login button', :js => true do
      visit root_path
      click_link('Login')
      page.should have_button('Go Flirt')
    end
  end

  describe 'POST /login' do

    let(:user) { User.create(email: 'x@gmail.com', username: 'x', password: 'x', password_confirmation: 'x') }

    it 'creates a new session for the user with correct information', :js => true do
      visit root_path

      click_link('Login')
      fill_in 'username', with: 'x'
      fill_in 'password', with: 'x'

      click_button('Go Flirt')

      page.should_not have_button('cancel')

    end

    it 'DOES NOT create a new session for the user with incorrect password', :js => true do
      visit root_path

      click_link('Login')
      fill_in 'username', with: 'x'
      fill_in 'password', with: 'y'

      click_button('Go Flirt')

      page.should_not have_link('Cancel')
      page.should have_button('Cancel')
    end

  end

  describe 'JS close_form()' do
    it 'the cancel button removes the form from the page', :js => true do
      visit root_path
      click_link('Register')
      click_link('Cancel')
      page.should_not have_button('Cancel')
    end
  end

end