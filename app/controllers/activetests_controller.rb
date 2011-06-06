class ActivetestsController < ApplicationController
  
  layout "student"
  before_filter :require_user, :only => [:index,:show, :edit, :update]
  
  def index
    @examination = Examination.all
    @userexaminations = Userexamination.find(:all, :conditions => {:user_id => @created_by},:order => 'userexaminations.exam_complete_status')
    
    @user = User.first(:conditions=>{:id=>@created_by})
   if @user.login_count == 1
     redirect_to :controller=>'student',:action=>'change_pass',:id=>@created_by
   end
  end
  
  def testcompleted
    @exam_results = Userexamination.find(:first, :conditions=>{ :user_id=>@created_by, :examination_id=>params[:exam_id]})
  end
  
end
