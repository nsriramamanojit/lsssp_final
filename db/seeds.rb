########### Users ##################
session = User.create do |u|
  u.name = "SuperAdmin"
  u.email = 'superadmin@lsssp.org'
  u.password = u.password_confirmation = 'admin123'
  u.mobile_number=9885976490
  u.phone_numeber=8662524890
  u.status = 'Approved'
  u.created_by = 1
end
session.save
session = User.create do |u|
  u.name = "Admin"
  u.email = 'admin@lsssp.org'
  u.password = u.password_confirmation = 'admin123'
  u.mobile_number=9885976490
  u.phone_number=8662524890
  u.status = 'Approved'
  u.created_by = 1
end
session.save
session = User.create do |u|
  u.name = "Chaitanya"
  u.email = 'nchaitanya@lsssp.org'
  u.password = u.password_confirmation = 'student123'
  u.mobile_number=9885976490
  u.phone_number=8662524890
  u.status = 'Approved'
  u.created_by = 1
end
session.save
########## Roles

Role.create(:name=>'super_admin',:created_at=>Time.now,:updated_at=>Time.now)
Role.create(:name=>'admin',:created_at=>Time.now,:updated_at=>Time.now)
Role.create(:name=>'student',:created_at=>Time.now,:updated_at=>Time.now)

########## Assigmments ###############

Assignment.create(:user_id=>1,:role_id=>1,:created_at=>Time.now,:updated_at=>Time.now)
Assignment.create(:user_id=>2,:role_id=>2,:created_at=>Time.now,:updated_at=>Time.now)
Assignment.create(:user_id=>3,:role_id=>3,:created_at=>Time.now,:updated_at=>Time.now)

########## Subjects #####################
Subject.create(:name=>"LP", :description=>"Description")
Subject.create(:name=>"SSGB",:description=>"HTML Description")

################QuestionBank##################
#Questionbank.create(:subject_id=>1,:question_option=>"random", :question_type=>"text", :question_text=>"Question-1", :option1_text_check=>1, :option2_text_check=>0,:option3_text_check=>0,:option4_text_check=>0,:option1_text=>"Answer-1",:option2_text=>"Answer-2",:option3_text=>"Answer-3",:option4_text=>"Answer-4")
#Questionbank.create(:subject_id=>1,:question_option=>"random", :question_type=>"text", :question_text=>"Question-2", :option1_text_check=>1, :option2_text_check=>0,:option3_text_check=>0,:option4_text_check=>0,:option1_text=>"Answer-1",:option2_text=>"Answer-2",:option3_text=>"Answer-3",:option4_text=>"Answer-4")
#Questionbank.create(:subject_id=>1,:question_option=>"random", :question_type=>"text", :question_text=>"Question-3", :option1_text_check=>1, :option2_text_check=>0,:option3_text_check=>0,:option4_text_check=>0,:option1_text=>"Answer-1",:option2_text=>"Answer-2",:option3_text=>"Answer-3",:option4_text=>"Answer-4")
#Questionbank.create(:subject_id=>1,:question_option=>"random", :question_type=>"text", :question_text=>"Question-4", :option1_text_check=>1, :option2_text_check=>0,:option3_text_check=>0,:option4_text_check=>0,:option1_text=>"Answer-1",:option2_text=>"Answer-2",:option3_text=>"Answer-3",:option4_text=>"Answer-4")
#Questionbank.create(:subject_id=>1,:question_option=>"random", :question_type=>"text", :question_text=>"Question-5", :option1_text_check=>1, :option2_text_check=>0,:option3_text_check=>0,:option4_text_check=>0,:option1_text=>"Answer-1",:option2_text=>"Answer-2",:option3_text=>"Answer-3",:option4_text=>"Answer-4")
#Questionbank.create(:subject_id=>2,:question_option=>"random", :question_type=>"text", :question_text=>"Question-1", :option1_text_check=>1, :option2_text_check=>0,:option3_text_check=>0,:option4_text_check=>0,:option1_text=>"Answer-1",:option2_text=>"Answer-2",:option3_text=>"Answer-3",:option4_text=>"Answer-4")
#Questionbank.create(:subject_id=>2,:question_option=>"random", :question_type=>"text", :question_text=>"Question-2", :option1_text_check=>1, :option2_text_check=>0,:option3_text_check=>0,:option4_text_check=>0,:option1_text=>"Answer-1",:option2_text=>"Answer-2",:option3_text=>"Answer-3",:option4_text=>"Answer-4")
#Questionbank.create(:subject_id=>2,:question_option=>"random", :question_type=>"text", :question_text=>"Question-3", :option1_text_check=>1, :option2_text_check=>0,:option3_text_check=>0,:option4_text_check=>0,:option1_text=>"Answer-1",:option2_text=>"Answer-2",:option3_text=>"Answer-3",:option4_text=>"Answer-4")
#Questionbank.create(:subject_id=>2,:question_option=>"random", :question_type=>"text", :question_text=>"Question-4", :option1_text_check=>1, :option2_text_check=>0,:option3_text_check=>0,:option4_text_check=>0,:option1_text=>"Answer-1",:option2_text=>"Answer-2",:option3_text=>"Answer-3",:option4_text=>"Answer-4")
#Questionbank.create(:subject_id=>2,:question_option=>"random", :question_type=>"text", :question_text=>"Question-5", :option1_text_check=>1, :option2_text_check=>0,:option3_text_check=>0,:option4_text_check=>0,:option1_text=>"Answer-1",:option2_text=>"Answer-2",:option3_text=>"Answer-3",:option4_text=>"Answer-4")

########### Examination ####################3
#Examination.create(:examname=>"LSSSP-Lean", :duration=>60, :module_questions=>"1:30,2:20", :passmarks=>10,:positivemarks=>2,:negativemarks=>0,:notattemptmarks=>0)
#Examination.create(:examname=>"LSSSP-GreenBelt", :duration=>40, :module_questions=>"1:10,4:20", :passmarks=>10,:positivemarks=>2,:negativemarks=>0,:notattemptmarks=>0)
##################### User Examination ###################
#Userexamination.create(:user_id=>3, :examination_id=>1,:duration=>60)
#Userexamination.create(:user_id=>3, :examination_id=>2,:duration=>40)
