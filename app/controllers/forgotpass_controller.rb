class ForgotpassController < ApplicationController
  
  def index
  end
  
  def reset
    @useremail = params[:email]
    @user = User.find(:first, :conditions=>{:email=>@useremail})
    UserMailer.forgot_email(@user).deliver
  end
end
