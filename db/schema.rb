# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110524081636) do

  create_table "activetests", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "activexams", :force => true do |t|
    t.integer  "user_id"
    t.integer  "examination_id"
    t.integer  "subject_id"
    t.integer  "question_id"
    t.integer  "answer"
    t.integer  "time_remain"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "assignments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "examinations", :force => true do |t|
    t.string   "examname"
    t.integer  "duration"
    t.string   "module_questions"
    t.integer  "positivemarks"
    t.integer  "negativemarks",    :default => 0
    t.integer  "notattemptmarks",  :default => 0
    t.integer  "passmarks"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payments", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "questionbanks", :force => true do |t|
    t.integer  "subject_id"
    t.string   "question_option"
    t.string   "question_type"
    t.text     "question_text"
    t.string   "question_imagepath"
    t.boolean  "option1_text_check"
    t.boolean  "option2_text_check"
    t.boolean  "option3_text_check"
    t.boolean  "option4_text_check"
    t.boolean  "option5_text_check"
    t.text     "option1_text"
    t.text     "option2_text"
    t.text     "option3_text"
    t.text     "option4_text"
    t.text     "option5_text"
    t.boolean  "option1_image_check"
    t.boolean  "option2_image_check"
    t.boolean  "option3_image_check"
    t.boolean  "option4_image_check"
    t.boolean  "option5_image_check"
    t.text     "option1_imagepath"
    t.text     "option2_imagepath"
    t.text     "option3_imagepath"
    t.text     "option4_imagepath"
    t.text     "option5_imagepath"
    t.text     "question_image_file_name"
    t.integer  "correct_answer"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "question_file_name"
    t.string   "question_content_type"
    t.integer  "question_file_size"
    t.string   "option1_file_name"
    t.string   "option1_content_type"
    t.integer  "option1_file_size"
    t.string   "option2_file_name"
    t.string   "option2_content_type"
    t.integer  "option2_file_size"
    t.string   "option3_file_name"
    t.string   "option3_content_type"
    t.integer  "option3_file_size"
    t.string   "option4_file_name"
    t.string   "option4_content_type"
    t.integer  "option4_file_size"
    t.string   "option5_file_name"
    t.string   "option5_content_type"
    t.integer  "option5_file_size"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "subjects", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "userexaminations", :force => true do |t|
    t.integer  "user_id"
    t.string   "examination_id"
    t.boolean  "exam_active_status",   :default => false
    t.integer  "number_of_attempts",   :default => 0
    t.boolean  "exam_complete_status", :default => false
    t.integer  "duration"
    t.integer  "time_remain"
    t.integer  "no_of_questions"
    t.integer  "questions_answered"
    t.integer  "total_score"
    t.boolean  "result_status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone_number"
    t.string   "mobile_number"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token",                         :null => false
    t.integer  "login_count",       :default => 0,          :null => false
    t.datetime "last_request_at"
    t.datetime "last_login_at"
    t.datetime "current_login_at"
    t.string   "last_login_ip"
    t.string   "current_login_ip"
    t.string   "status",            :default => "Approved"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "enrollment_number"
    t.string   "perishable_token",  :default => "",         :null => false
  end

  add_index "users", ["perishable_token"], :name => "index_users_on_perishable_token"

end
