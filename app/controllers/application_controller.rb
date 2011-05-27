class ApplicationController < ActionController::Base
  protect_from_forgery
#  before_filter :require_no_user
#  before_filter :load_user_using_perishable_token, :only => [ :edit, :update ]
   
  before_filter :created_by_or_updated_by
  helper_method :current_user_session, :current_user
  #  filter_parameter_logging :password, :password_confirmation
  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  #  before_filter { |c| Authorization.current_user = c.current_user }
  def created_by_or_updated_by
    if current_user
      @created_by = current_user.id
      @updated_by = current_user.id
      @created_name = current_user.first_name
      @updated_name = current_user.first_name
    end
  end
  
  
  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end
  
  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end
  
  def require_user
    unless current_user
      store_location
      flash[:notice] = "You must be logged in to access this page"
      redirect_to new_user_session_url
      return false
    end
  end
  
  def require_no_user
    if current_user
      store_location
      flash[:notice] = "You must be logged out to access this page"
      redirect_to user_path(current_user)
      return false
    end
  end
  
  def store_location
    session[:return_to] = request.request_uri
  end
  
  def redirect_back_or_default(default)
    redirect_to(session[:return_to] || default)
    session[:return_to] = nil
  end
  
  protected
  
  def permission_denied
    flash[:error] = "Sorry, you are not allowed to access that page."
    redirect_to root_url
  end
  
end
