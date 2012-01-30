class FirstloginsController < ApplicationController
   
  before_filter :require_user
  def index
    @user = User.find(current_user.id)
  end
  
  def changeprofile
    @user = User.find(params[:id])
    @user.updated_by = @updated_by
    @user.status = "Approved"
    @user.verified_date = Time.now
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to({:controller=>'activetests',:action=>'index'}, :notice => 'Profile was successfully updated.') }
        format.xml  { head :ok }
      else
       format.html { render :controller=>'firstlogins',:action => "index",:id=>current_user.id }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end

  end
end
