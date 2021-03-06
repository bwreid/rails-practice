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

    it 'creates a new session for the user with correct information', :js => true do
      visit root_path

      subscriber = Subscriber.create( tagline: 'change your tagline!', bio: 'change your bio!', gender: 'pick a gender', age: 999 )
      subscriber.user = User.create(email: 'haljordan@gmail.com', username: 'haljordan', password: 'x', password_confirmation: 'x')

      click_link('Login')
      fill_in 'username', with: subscriber.user.username
      fill_in 'password', with: 'x'

      click_button('Go Flirt')
      page.should_not have_button('Go Flirt')
      page.should have_link(subscriber.user.username)
      page.should_not have_link('Register')
      page.should_not have_link('Login')

      visit root_path
      page.should have_link(subscriber.user.username)
      page.should_not have_link('Register')
      page.should_not have_link('Login')
    end

    it 'logs the user off of the system', :js => true do
      add_subscriptions
      subscriber = Subscriber.create( tagline: 'change your tagline!', bio: 'change your bio!', gender: 'pick a gender', age: 999 )
      subscriber.user = User.create(email: 'haljordan@gmail.com', username: 'haljordan', password: 'x', password_confirmation: 'x')

      visit root_path

      click_link('Login')
      fill_in 'username', with: subscriber.user.username
      fill_in 'password', with: 'x'

      click_button('Go Flirt')

      click_link('Logout')
      page.should_not have_link(subscriber.user.username)
      page.should have_link('Register')
      page.should have_link('Login')

      visit root_path
      page.should_not have_link(subscriber.user.username)
      page.should have_link('Register')
      page.should have_link('Login')

      page.should_not have_link('Free')
      page.should_not have_link('Basic')
      page.should_not have_link('Premium')
    end

    it 'DOES NOT create a new session for the user with incorrect password', :js => true do
      visit root_path

      click_link('Login')
      fill_in 'username', with: 'x'
      fill_in 'password', with: 'y'

      click_button('Go Flirt')

      page.should have_link('Cancel')

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


def add_subscriptions
  Subscription.create( :plan => 'Free', cost: 0 )
  Subscription.create( :plan => 'Basic', cost: 1.99 )
  Subscription.create( :plan => 'Premium', cost: 3.99 )
end