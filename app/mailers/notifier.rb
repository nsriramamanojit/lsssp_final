class Notifier < ActionMailer::Base
 default_url_options[:host] = "69.72.149.226:9999"  
  
  def password_reset_instructions(user)  
    subject       "Password Reset Instructions"  
    from          "admin@lsssp.org "  
    recipients    user.email  
    sent_on       Time.now  
    body          :edit_password_reset_url => edit_password_reset_url(user.perishable_token)  
  end  
end