class UserMailer < ActionMailer::Base
 default :from => "lsssp@lsssp.com"
 
  def welcome_email(user)
    @user = user
    @url  = "http://123.176.41.122:5555"
    mail(:to => user.email,
         :subject => "Welcome to My Awesome Site")
  end


  def forgot_email(user)
   @user = user
   @url = "http://123.176.41.122:5555"
	mail(:to =>user.email, :subject=>"Password Recovery")
  end	
end
