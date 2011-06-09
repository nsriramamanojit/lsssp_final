class RegistrationsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    enrollment_number  = rand(1000000000-9999999999)
    @user.password = @user.password_confirmation = params[:user][:email]
    @user.enrollment_number = enrollment_number
    @user.login_count = 0
    respond_to do |format|
      if @user.save
        #send mail
        UserMailer.welcome_email(@user).deliver
        format.html { render :action=>"registration_complete" }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def registration_complete
  end
end
