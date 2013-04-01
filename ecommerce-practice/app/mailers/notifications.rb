class Notifications < ActionMailer::Base
  def login_message(user)
    @user = user
    mail  :to => user.email,
          :from => 'holla@bryanwreid.com',
          :subject => 'I see you logging in...'
  end
end