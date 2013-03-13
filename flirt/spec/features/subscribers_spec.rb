require 'spec_helper'

describe 'Subscribers' do # THIS IS LIKE THE SUBSCRIBERS CONTROLLER
  describe 'GET /' do # THESE ARE THE 'VERBS' WE'RE TRYING OUT
    it 'displays register button on the root path' do
      visit root_path
      page.should have_link('Register')
    end
  end

  describe 'GET /subscribers/new' do
    it 'displays the create subscriber button', :js => true do
      visit root_path
      click_link('Register')
      page.should have_button('Create Subscriber')
    end
  end

  describe 'POST /subscribers' do
    it 'creates a new subscriber', :js => true do
      visit root_path
      click_link('Register')
      fill_in('Username', with: 'x')
      fill_in('Email', with: 'x')

      fill_in 'subscriber_password', with: 'x'
      fill_in 'subscriber_password_confirmation', with: 'x'

      click_button('Create Subscriber')

      page.should_not have_button('Cancel')
      page.should have_text('You have created an account!')
      expect(Subscriber.first.username).to eq('x')
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