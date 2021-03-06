class UserexaminationsController < ApplicationController
  layout "admin"
  def index
    @userexaminations = Userexamination.all
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @userexaminations }
    end
  end
  
  def show
    @userexamination = Userexamination.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @userexamination }
    end
  end
  
  def new
    @userexamination = Userexamination.new
    @examinations = Examination.all
    @user_id = params[:user_id]
    @user_name = User.find(params[:user_id]).email
    @userexam = Userexamination.find(:all,:conditions=>{:user_id=>@user_id})
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @userexamination }
    end
  end
  
  def edit
    @userexamination = Userexamination.find(params[:id])
    @examinations = Examination.all
  end
  
  def create
    #    @examinations = Examination.all
    
    #    @examinations.each_with_index do | s, index |
    #      exam_id = params["exam_#{s.id}".to_sym]
    #      @totalduration = Examination.find(:first, :conditions=>{:id => exam_id})
    #      @duration = @totalduration.duration
    #      @userexamination = Userexamination.new(:user_id => params[:user_id],:examination_id => exam_id,:duration=>@duration)
    #      @userexamination.save
    #    end
    params[:exam][:exam_ids].each do |exam_id|
      @totalduration = Examination.find(:first, :conditions=>{:id => exam_id.to_i})
      @duration = @totalduration.duration
      @userexamination = Userexamination.new(:user_id => params[:user_id],:examination_id => exam_id.to_i,:duration=>@duration)
      @userexamination.save
    end
    @userexam=Userexamination.find(:all,:conditions=>{:user_id=>params[:user_id],:created_at => Date.today.beginning_of_day .. Date.today.end_of_day})
    @user = User.find(:first,:conditions=>{:id=>params[:user_id]})
    UserMailer.exam_email(@user,@userexam).deliver
    redirect_to users_path   
    #    redirect_to users_path
    #--------------------------------------------------------------------- 
    
    #         @userexamination=Userexamination.new(params[:userexamination])
    #         @userexamination.user_id = params[:user_id]
    
    #    respond_to do |format|
    #      if @userexamination.save
    #        format.html { redirect_to(@userexamination, :notice => 'User Examination was successfully created.') }
    #        format.xml  { render :xml => @userexamination, :status => :created, :location => @userexamination }
    #      else
    #        format.html { render :action => "new" }
    #        format.xml  { render :xml => @userexamination.errors, :status => :unprocessable_entity }
    #      end
    #    end
  end
  
  def update
    @userexamination = Userexamination.find(params[:id])
    @examinations = Examination.all
    
    @examinations.each_with_index do | s, index |
      exam_id = params["exam_#{s.id}".to_sym]
      @userexamination.user_id = params[:userexamination][:user_id]
      @userexamination.examination_id = exam_id
      @userexamination.duration = params[:duration]
      #      @userexamination = Userexamination.new(:user_id => params[:user_id],:examination_id => exam_id,:duration=>@duration)
      @userexamination.save
    end
    
    #    respond_to do |format|
    #      if @userexamination.update_attributes(params[:userexamination])
    #        format.html { redirect_to(@userexamination, :notice => 'Userexamination was successfully updated.') }
    #        format.xml  { head :ok }
    #      else
    #        format.html { render :action => "edit" }
    #        format.xml  { render :xml => @userexamination.errors, :status => :unprocessable_entity }
    #      end
    #    end
  end
  
  def destroy
    @userexamination = Userexamination.find(params[:id])
    @userexamination.destroy
    
    respond_to do |format|
      format.html { redirect_to(userexaminations_url) }
      format.xml  { head :ok }
    end
  end
  
  def delete
    @userexamination = Userexamination.find(:first,:conditions=>{:user_id=>params[:user_id], :examination_id=>params[:exam_id]})
    @userexamination.destroy
    Activexam.destroy_all(:user_id=>params[:user_id], :examination_id=>params[:exam_id])
    redirect_to :back
  end
  
  def exam_status
    @examination = Examination.all
    @user = User.find(:first, :conditions=>{:id=>params[:user_id]})
    @userexaminations = Userexamination.find(:all, :conditions => {:user_id => params[:user_id]})
    
  end
  
  def manual
    @examination = Examination.all
    @user = User.find(:first, :conditions=>{:id=>params[:user_id]})
    @userexamination = Userexamination.find(:first, :conditions => {:user_id => params[:user_id],:examination_id=>params[:exam_id]})
  end
  def manual_entry
    @userexamination = Userexamination.find(:first, :conditions => {:user_id => params[:user_id],:examination_id=>params[:exam_id]})
    @userexamination.total_score = params[:total_score]
    @userexamination.exam_complete_status = 1
    passmarks = @userexamination.examination.passmarks
    marks = params[:total_score]
    
    if marks.to_i >= passmarks
       @userexamination.result_status = true
    else
       @userexamination.result_status = false
    end
   @userexamination.save
    redirect_to users_path
  end
end
