class QuestionbanksController < ApplicationController
  layout "admin", :except => :show
  before_filter :require_user, :only => [:index,:show, :edit, :update]
  def index
    @questionbanks = Questionbank.all.paginate :per_page => 10, :page => params[:page]  #Pagination for 10 Records
    @subjects = Subject.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @questionbanks }
    end
  end

  def show
    @questionbank = Questionbank.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @questionbank }
    end
  end

  def new
    @module_id = params[:module_id]
    @module_name = Subject.find(params[:module_id]).name
    @questionbank = Questionbank.new
    @questionbanks = Questionbank.find(:all, :conditions=>{:subject_id => @module_id}).paginate :per_page => 10, :page => params[:page]  #Pagination for 10 Records

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @questionbank }
    end
  end

  def edit
    @question_id = params[:id]
    @questionbank = Questionbank.find(params[:id])
    @module_id = @questionbank.subject_id
    @module_name = Subject.find(@module_id).name
  #    @questionbank = Questionbank.find(:first, :conditions=>{:subject_id => @module_id})

  end

  def create
    @questionbank = Questionbank.new(params[:questionbank])
    @questionbanks = Questionbank.all.paginate :per_page => 10, :page => params[:page]  #Pagination for 10 Records

    respond_to do |format|
      if @questionbank.save
        format.html { redirect_to :back }
      #        format.xml  { render :xml => @questionbank, :status => :created, :location => @questionbank }
      format.js
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @questionbank.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @question = Questionbank.find(params[:questionbank][:question_id])
    @module_id = @question.subject_id
    @module_name = Subject.find(@module_id).name
    @question.subject_id = params[:questionbank][:subject_id]
    @question.question_option = params[:questionbank][:question_option]
    @question.question_type = params[:questionbank][:question_type]
    @question.question_text = params[:questionbank][:question_text]
    @question.option1_text = params[:questionbank][:option1_text]
    @question.option2_text = params[:questionbank][:option2_text]
    @question.option3_text = params[:questionbank][:option3_text]
    @question.option4_text = params[:questionbank][:option4_text]
    @question.option5_text = params[:questionbank][:option4_text]
    @question.option1_text_check = params[:questionbank][:option1_text_check]
    @question.option2_text_check = params[:questionbank][:option2_text_check]
    @question.option3_text_check = params[:questionbank][:option3_text_check]
    @question.option4_text_check = params[:questionbank][:option4_text_check]
    @question.option5_text_check = params[:questionbank][:option5_text_check]

    @question.save
    redirect_to :action=>'index'
  #    respond_to do |format|
  #      if @question.save
  #       format.html { redirect_to(@questionbank, :notice => 'Questionbank was successfully updated.') }
  #      format.xml  { head :ok }
  #    else
  #      format.html { render :action => "edit" }
  #      format.xml  { render :xml => @questionbank.errors, :status => :unprocessable_entity }
  #    end
  # end
  end

  def destroy
    @questionbank = Questionbank.find(params[:id])
    @questionbank.destroy

    respond_to do |format|
      format.html { redirect_to(questionbanks_url) }
      format.xml  { head :ok }
    end
  end
end
