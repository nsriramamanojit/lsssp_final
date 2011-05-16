class UsersController < ApplicationController
  layout 'admin'

  #before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => [:index,:show, :edit, :update]
  def index

    @users = User.all #paginate :page => params[:page], :per_page=>10,:order => 'created_at DESC'
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    @user.created_by = @created_by
    respond_to do |format|
      if @user.save 
      	#send mail
        UserMailer.welcome_email(@user).deliver
        format.html { redirect_to(users_path, :notice => 'User was successfully created.') }    
      else
        format.html { render :action => "new" }
      end
    end
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
#    params[:user][:role_ids] ||= []
    
    @user.updated_by = @updated_by
    respond_to do |format|
      if @user.update_attributes(params[:user])     
        format.html { redirect_to(users_path, :notice => 'User was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end
  
    def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end
  

  
 
end
