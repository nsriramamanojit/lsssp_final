require 'fastercsv'
class UsersController < ApplicationController
  layout 'admin'
  
  #before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => [:index,:show, :edit, :update]
  def index
    @users = User.all.paginate :per_page => 20, :page => params[:page]  #Pagination for 10 Records
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
  
  def csv_import
    @user=CSV::Reader.parse(params[:upload][:file])
    n=0
    @user.each do |row|
      user = User.create do |u|
        u.name  =row[0]
        u.email = row[1]
        u.password = u.password_confirmation = row[1]
        u.mobile_number = row[2]
        u.phone_number = row[3]
        u.status = 'Approved'
        u.created_by = 2
        u.updated_by=2
      end
    end
    end
    def upload
   end
    
  end
