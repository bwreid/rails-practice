class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def sendtxt
    name = params[:first]
    body = params[:body]
    user = User.where( :name => name ).first # ADD FIRST BECAUSE IT WILL TURN BACK AN ARRAY
    client = Twilio::REST::Client.new(ENV['TW_SID'], ENV['TW_TOK'])
    client.account.sms.messages.create(:from => "+16504259317", :to => user.phone, :body => body )
    redirect_to(root_path)
  end
end