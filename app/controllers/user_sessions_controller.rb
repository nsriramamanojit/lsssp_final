class UserSessionsController < ApplicationController
  before_filter :require_user, :only => :destroy
  layout nil
  def new
    @user_session = UserSession.new
  end
  
  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = "Login successful!"
      user = User.find_by_email(params[:user_session][:email]) 
      super_admin = Role.find_by_name('super_admin') 
      admin = Role.find_by_name('admin')
      student = Role.find_by_name('student')
      if user.status == "Approved"
      if user.roles.include?(super_admin) 
              redirect_to(:controller=>'adminindex',:action=>'index')
      elsif user.roles.include?(admin) 
              redirect_to(:controller=>'adminindex',:action=>'index')
      else user.roles.include?(student)
        redirect_to(:controller=>'student',:action=>'index')
      end
 
      else
       # @user_session.destroy
        flash[:error] = "Your Account Not Approved,Please contact Admin for more info.."
      end
  else
    flash[:error] = "Invalid username or password"
    render :action => :new
  end
end

def destroy
  current_user_session.destroy
  flash[:notice] = "Logout successful!"
  redirect_back_or_default new_user_session_url
end
end
