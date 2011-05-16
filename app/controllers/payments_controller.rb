class PaymentsController < ApplicationController
  layout "admin"
  before_filter :require_user, :only => [:index,:show, :edit, :update]
  
  def index
    @payments = Payment.all
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @payments }
    end
  end
  
  def show
    @payment = Payment.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @payment }
    end
  end
  
  def new
    @payment = Payment.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @payment }
    end
  end
  
  def edit
    @payment = Payment.find(params[:id])
  end
  
  def create
    @payment = Payment.new(params[:payment])
    
    respond_to do |format|
      if @payment.save
        format.html { redirect_to(@payment, :notice => 'Payment was successfully created.') }
        format.xml  { render :xml => @payment, :status => :created, :location => @payment }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @payment.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def update
    @payment = Payment.find(params[:id])
    
    respond_to do |format|
      if @payment.update_attributes(params[:payment])
        format.html { redirect_to(@payment, :notice => 'Payment was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @payment.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @payment = Payment.find(params[:id])
    @payment.destroy
    
    respond_to do |format|
      format.html { redirect_to(payments_url) }
      format.xml  { head :ok }
    end
  end
end
