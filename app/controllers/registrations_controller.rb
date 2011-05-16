class RegistrationsController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    respond_to do |format|
      if @user.save
        format.html { render :action=>"registration_complete" }    
      else
        format.html { render :action => "new" }
      end
    end
  end
  
  def registration_complete
  end
end
