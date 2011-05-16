module ApplicationHelper
  
  def admin_tabs
    html = ''
    super_admin = Role.find_by_name('super_admin')
    admin = Role.find_by_name('admin')
    if current_user.roles.include?(super_admin) 
      
      html << "<li>"
      html << link_to('Users',{:controller=>'user',:action=>'index'},:class=>(current_page?(:controller=>'user',:action=>'index') ? "users selected" : ""))
      html << "</li>"


            
    elsif current_user.roles.include?(admin) 
      
      html <<  '<li>'
      html << link_to('Module',{:controller=>'subjects',:action=>'index'},:class=>(current_page?(:controller=>'subjects',:action=>'index') ? "subjects selected" : ""))
      html << '</li>'
     
      html <<  '<li>'
      html << link_to('Examination',{:controller=>'examinations',:action=>'index'},:class=>(current_page?(:controller=>'examinations',:action=>'index') ? "examinations selected" : ""))
      html << '</li>'
      
      html <<  '<li>'
      html << link_to('Payment',{:controller=>'payments',:action=>'index'},:class=>(current_page?(:controller=>'payments',:action=>'index') ? "payments selected" : ""))
      html << '</li>'
      
      html <<  '<li>'
      html << link_to('Users',{:controller=>'users',:action=>'index'},:class=>(current_page?(:controller=>'users',:action=>'index') ? "users selected" : ""))
      html << '</li>'

     end 
    html.html_safe
  end

  def student_tabs
    html = ''
      html << "<li>"
      html << link_to('Examination',{:controller=>'activetests',:action=>'index'},:class=>(controller_name.eql?('activetests') ? "activetests" : "")) 
      html << "</li>"

     html << "<li>"
      html << link_to('Services',{:controller=>'services',:action=>'index'},:class=>(controller_name.eql?('services') ? "active" : "")) 
      html << "</li>"
      
      
    html.html_safe
  end   
end
