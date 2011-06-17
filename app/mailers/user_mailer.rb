class UserMailer < ActionMailer::Base
  default :from => "support@lsssp.org"
  
  def welcome_email(user)
    @user = user
    #    @url  = "http://123.176.41.122:5555"
    mail(:to => user.email,
         :subject => "Welcome to LSSSP")
  end
  
  
  def forgot_email(user)
    @user = user
    #   @url = "http://123.176.41.122:5555"
    mail(:to =>user.email, :subject=>"Password Recovery")
  end
  
    def exam_email(user,userexam)
    @user = user
    @userexam = userexam
    
    #   @url = "http://123.176.41.122:5555"
    mail(:to =>user.email, :subject=>"LSSSP Examination Notification")
  end
  
  def bulk_email(user)
    #    @user = user
    #    @url  = "http://123.176.41.122:5555"
    mail(:to => user.email,
         :subject => "Welcome to LSSSP")
  end

end
