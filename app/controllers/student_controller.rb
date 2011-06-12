class StudentController < ApplicationController

	layout "student"
	
	def index
	end
	
	def show
	    @user = User.find(params[:id])
	end
	
	def edit
	   @user = User.find(params[:id])
	end
	
  def update_profile
    @user = User.find(params[:id])
    @user.updated_by = @updated_by
    respond_to do |format|
      if @user.update_attributes(params[:user])
        
        format.html { redirect_to({:action=>'show',:id=>current_user.id
          }, :notice => 'Profile was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit",:id=>current_user.id }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end
	def change_pass
       @user = User.find(params[:id])
 end
 
  def update_pass
    @user = User.find(params[:id])
#    @user.updated_by = @updated_by
    puts "$$$$$$$$$$$$$$$$$$$$$"
    
    puts @user.password = params[:user][:password]
    puts @user.password_confirmation = params[:user][:password_confirmation]
    respond_to do |format|
      if @user.save #update_attributes(params[:user])
        format.html { redirect_to({:action=>'show',:id=>current_user.id
          }, :notice => 'Password was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "change_pass",:id=>current_user.id }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end
end
