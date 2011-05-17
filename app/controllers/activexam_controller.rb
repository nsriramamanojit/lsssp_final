class ActivexamController < ApplicationController
  layout "exam"
  before_filter :require_user, :only => [:index,:show, :edit, :update, :create]
  
  def index
    # 	@questions = Questionbank.all
    #  	@examinations = Examination.find(params[:exam_id])
  end
  
  def new
    #   @activexam = Activexam.new
  end
  
  def create
    @exam_active = Userexamination.find(:first, :conditions=>{ :user_id=>@created_by, :examination_id=>params[:exam_id]})
    
    #check if user is completed exam or not 
    if @exam_active.exam_complete_status == true
      redirect_to :controller=> 'activetests', :action=>'testcompleted', :exam_id => params[:exam_id]
    else # for exam completed or not
      
      @exam_active.exam_active_status =1
      @exam_active.number_of_attempts = @exam_active.number_of_attempts + 1
      @exam_active.save
      
      remain_time = @exam_active.time_remain
      if remain_time == nil
        @total_time = @exam_active.duration
      else
        remain_time
        @total_time = (remain_time/60)
      end      
      
      @user_exam_init = Activexam.find(:all, :conditions=>{:user_id => @created_by, :examination_id=>params[:exam_id]})
      
      @examination = Examination.find(params[:exam_id])
      module_questions = Examination.find(params[:exam_id]).module_questions.split(",")
      @module_id_array = Array.new
      @question_id_array = Array.new
      @no_of_q = 0
      module_questions.each do |module_questions|
        m_q_array = module_questions.split(":")
        @module_id_array << m_q_array[0]
        @question_id_array << m_q_array[1]   	
        @no_of_q = @no_of_q + m_q_array[1].to_i
        
      end	
      if @user_exam_init.size >= 1 
         @activexams = Activexam.find(:all, :conditions => {:examination_id => params[:exam_id], :user_id => @created_by, :subject_id=>@module_id_array})
      else
       (0..@module_id_array.size-1).each do | m|
          @questions_required = Questionbank.find(:all, :conditions=>{:subject_id => @module_id_array[m]}, :limit=> @question_id_array[m])
          @questions_required_rand = @questions_required.sort_by {rand}
          @questions_required_rand.each do |q |
          @activexam = Activexam.new(:user_id => @created_by,:examination_id => params[:exam_id],:subject_id => @module_id_array[m] , :question_id => q.id)
          @activexam.save
          end
        end
        @activexams = Activexam.find(:all, :conditions => {:examination_id => params[:exam_id], :user_id => @created_by, :subject_id=>@module_id_array})
      end #exam_int	 
    end # End of If condition Exam completed or not Check
    
    @aexam = @activexams.first
    
    @question = Questionbank.find_by_id_and_subject_id( @aexam.question_id,  @aexam.subject_id )
    
  end
  
  def show
    @aexam = Activexam.find(params[:id])   
    @question = Questionbank.find_by_id_and_subject_id(@aexam.question_id,@aexam.subject_id)
    #    puts "#####################  #{@question.id}"
    respond_to do |format|
      format.js
    end
  end 
  
  def test_complete
    #  	exam_id = params[:exam_id]
    @total_notanswer = Activexam.count(:conditions=>{:answer => nil, :user_id => @created_by, :examination_id =>params[:exam_id]})
    @total_questions = Activexam.count(:conditions => {:examination_id => params[:exam_id], :user_id=>@created_by})
    @total_answered = @total_questions - @total_notanswer
    
    @exam_active = Userexamination.find(:first, :conditions=>{ :user_id=>@created_by, :examination_id=>params[:exam_id]})
    @exam_active.exam_complete_status =1
    @exam_active.questions_answered = @total_answered
    @exam_active.no_of_questions = @total_questions
    @exam_active.save
    
  end
  
  def answer
    qid =  params[:question_id]
    answer_id =  params[:answer_id]
    sid = params[:subject_id]
    tid = params[:time]
    eid = params[:exam_id]
    
    time_array = tid.split(":")
    a = time_array[0].to_i
    b = time_array[1].to_i
    c = (60 * a) + b
    
    @exam = Activexam.find(:first, :conditions=>{ :user_id=>@created_by, :subject_id=> sid, :question_id => qid, :examination_id=>eid })
    @exam.answer = answer_id
    @exam.time_remain = c
    @exam.save
    
    respond_to do |format|
      format.js
    end
  end
  
  def save_exam
    tid = params[:time]
    time_array = tid.split(":")
    a = time_array[0].to_i
    b = time_array[1].to_i
    c = (60 * a) + b  
    
    @exam = Activexam.minimum('time_remain', :conditions=>{:user_id=>@created_by, :examination_id=>params[:exam_id]})
    if @exam == nil
      @userexamination = Userexamination.find(:first, :conditions=>{:user_id=>@created_by, :examination_id=>params[:exam_id]})#
      @userexamination.time_remain = c
      @userexamination.save
      redirect_to logout_path
    else
      @userexamination = Userexamination.find(:first, :conditions=>{:user_id=>@created_by, :examination_id=>params[:exam_id]})#
      @userexamination.time_remain = @exam
      @userexamination.save
      redirect_to logout_path
    end
  end
  
  
end
