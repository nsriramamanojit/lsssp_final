class ExaminationsController < ApplicationController
  #Layout
  layout 'admin'
  #Authentication
  before_filter :require_user, :only => [:index,:show, :edit, :update]
  
  def index
    @examinations = Examination.all
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @examinations }
    end
  end
  
  
  def show
    @examination = Examination.find(params[:id])
    module_questions = Examination.find(params[:id]).module_questions.split(",")
    @module_id_array = Array.new
    @question_id_array = Array.new
    module_questions.each do |module_questions|
      m_q_array = module_questions.split(":")
      @module_id_array << m_q_array[0]
      @question_id_array << m_q_array[1]   	
    end
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @examination }
    end
  end
  
  def new
    @examination = Examination.new
    #@subjects = Questionbank.select("DISTINCT(subject_id)")
    @subjects = Subject.all
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @examination }
    end
  end
  
  def edit
    @examination = Examination.find(params[:id])
    @subjects = Subject.all
    module_questions = @examination.module_questions.split(",")    

       @module_id_array = Array.new
      @question_id_array = Array.new
      @no_of_q = 0
      module_questions.each do |module_questions|
        m_q_array = module_questions.split(":")
        @module_id_array << m_q_array[0]
        @question_id_array << m_q_array[1]    
      end 
     puts "***********************"
     puts @module_id_array.class
     puts @question_id_array.class   
  end
  
  def create
    @examination = Examination.new(params[:examination])
    @subjects = Subject.all
    storage_string = String.new
    @subjects.each_with_index do | s, index |
      if params["module_#{index}".to_sym]
        module_id = params["module_#{index}".to_sym]
        number_of_questions = params["no_of_questions_#{index}".to_sym]
        storage_string << module_id.to_s + ":" + number_of_questions + ","
      end
    end
    @examination.module_questions = storage_string.chop
    
    respond_to do |format|
      if @examination.save
        format.html { redirect_to(@examination, :notice => 'Examination was successfully created.') }
        format.xml  { render :xml => @examination, :status => :created, :location => @examination }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @examination.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def update
    @examination = Examination.find(params[:id])
    @subjects = Subject.all
    storage_string = String.new
    @subjects.each_with_index do | s, index |
      if params["module_#{index}".to_sym]
        module_id = params["module_#{index}".to_sym]
        number_of_questions = params["no_of_questions_#{index}".to_sym]
        storage_string << module_id.to_s + ":" + number_of_questions + ","
      end
    end
    @examination.module_questions = storage_string.chop
    
    respond_to do |format|
      if @examination.update_attributes(params[:examination])
        format.html { redirect_to(@examination, :notice => 'Examination was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @examination.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @examination = Examination.find(params[:id])
    @examination.destroy
    
    respond_to do |format|
      format.html { redirect_to(examinations_url) }
      format.xml  { head :ok }
    end
  end
end
