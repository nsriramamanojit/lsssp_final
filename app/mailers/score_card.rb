class ScoreCard < ActionMailer::Base
  default :from => "admin@lsssp.org"
   def score_card(active_exams,user,examination,total_questions,exam_active)
    @active_exams = active_exams
    @examination = examination
    @total_questions = total_questions
    @exam_active = exam_active
    @user = user
    mail(:to => user.email,
        :subject => "Your Score Card")
  end
  
  def score_card_admin(active_exams,user,examination,total_questions,exam_active)
    @active_exams = active_exams
    @examination = examination
    @total_questions = total_questions
    @exam_active = exam_active
    @user = user
    mail(:to => "admin@lsssp.org",
        :subject => "Your Score Card")
  end
end
