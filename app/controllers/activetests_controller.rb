class ActivetestsController < ApplicationController
  
  layout "student"
  before_filter :require_user, :only => [:index,:show, :edit, :update]
  
  def index
    @examination = Examination.all
    @userexaminations = Userexamination.find(:all, :conditions => {:user_id => @created_by})
  end
  
  def testcompleted
    @exam_results = Userexamination.find(:first, :conditions=>{ :user_id=>@created_by, :examination_id=>params[:exam_id]})
  end
  
end
