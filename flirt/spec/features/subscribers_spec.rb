require 'spec_helper'


describe 'Subscribers Controller' do # THIS IS LIKE THE SUBSCRIBERS CONTROLLER
  describe 'GET /' do # THESE ARE THE 'VERBS' WE'RE TRYING OUT
    it 'displays register button on the root path' do
      visit root_path
      page.should have_link('Register')
    end
  end

  describe 'POST /login', :js => true do
    let(:subscriber1) { Subscriber.create( tagline: 'change your tagline!', bio: 'change your bio!', gender: 'pick a gender', age: 999 ) }
    let(:admin1) { Administrator.create( role: 'SUPER-ADMIN' ) }
    let(:user) { User.create(email: 'x@gmail.com', username: 'x', password: 'x', password_confirmation: 'x') }

    it 'the subscriber can view a list of subscriptions' do
      add_subscriptions
      login_to_system_as_new_subscriber
      page.should have_button('Free')
      page.should have_button('Basic')
      page.should have_button('Premium')
    end

    it 'the subscriber should have a new subscription after clicking one of the plans', :js => true do
      add_subscriptions
      login_to_system_as_new_subscriber

      page.should have_button('Free')
      click_button('Free')
      sleep 1.5
      expect(User.first.sub.has_subscription?).to be true
      expect(User.first.sub.subscription.plan).to eq 'Free'
    end

    it 'the subscriber should not see the plans and should be able to go to the profile page after clicking a plan', :js => true do
      add_subscriptions
      login_to_system_as_new_subscriber
      page.should have_button('Free')
      click_button('Free')
      page.should_not have_button('Free')
      page.should have_link('Profile')
    end

    it 'the subscriber does not see a list of subscriptions' do
      add_subscriptions
      login_to_system_as_existing_subscriber
      page.should_not have_button('Free')
      page.should_not have_button('Basic')
      page.should_not have_button('Premium')
    end

    it 'the admin should not view subscriptions' do
      add_subscriptions
      login_to_system_as_admin
      page.should_not have_button('Free')
      page.should_not have_button('Basic')
      page.should_not have_button('Premium')
    end

  end

  describe 'GET /subscribers/new' do
    it 'displays the create subscriber button', :js => true do
      visit root_path
      click_link('Register')
      page.should have_button('Create User')
    end
  end

  describe 'POST /subscribers' do
    it 'creates a new subscriber', :js => true do
      visit root_path
      click_link('Register')
      fill_in('Username', with: 'x')
      fill_in('Email', with: 'x')

      fill_in 'user_password', with: 'x'
      fill_in 'user_password_confirmation', with: 'x'

      click_button('Create User')

      page.should_not have_button('Cancel')
      page.should have_text('You have created an account!')
      expect(Subscriber.first.user.username).to eq('x')
    end

    it 'DOES NOT create a new subscriber, fails validation', :js => true do
      visit root_path
      click_link('Register')

      click_button('Create User')

      page.should have_button('Create User')
      page.should have_text('3 errors in this form:')
      page.has_css?('#form ul li', :count => 3)
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

def login_to_system_as_new_subscriber
  subscriber = Subscriber.create( tagline: 'change your tagline!', bio: 'change your bio!', gender: 'pick a gender', age: 999 )
  user =  User.create(email: 'haljordan@gmail.com', username: 'haljordan', password: 'x', password_confirmation: 'x')
  subscriber.user = user

  visit root_path

  click_link('Login')
  fill_in 'username', with: user.username
  fill_in 'password', with: 'x'

  click_button('Go Flirt')
end

def login_to_system_as_existing_subscriber
  subscriber = Subscriber.create( tagline: 'change your tagline!', bio: 'change your bio!', gender: 'pick a gender', age: 999 )
  subscriber.user = User.create(email: 'haljordan@gmail.com', username: 'haljordan', password: 'x', password_confirmation: 'x')
  subscriber.subscription = Subscription.create
  subscriber.save

  visit root_path

  click_link('Login')
  fill_in 'username', with: user.username
  fill_in 'password', with: 'x'

  click_button('Go Flirt')
end

def login_to_system_as_admin
  admin = Administrator.create( role: 'DBA' )
  admin.user = User.create(email: 'haljordan@gmail.com', username: 'haljordan', password: 'x', password_confirmation: 'x')

  visit root_path

  click_link('Login')
  fill_in 'username', with: user.username
  fill_in 'password', with: 'x'

  click_button('Go Flirt')
end

def add_subscriptions
  Subscription.create( :plan => 'Free', cost: 0, duration: 1 )
  Subscription.create( :plan => 'Basic', cost: 1.99, duration: 3 )
  Subscription.create( :plan => 'Premium', cost: 3.99, duration: 3 )
end
