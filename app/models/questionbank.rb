class Questionbank < ActiveRecord::Base
  belongs_to :subject
  belongs_to :activexam
  validates_attachment_presence :question, :if => "question_text.blank?"
  validates_attachment_presence :option1, :if => "option1_text.blank?"
  validates_attachment_presence :option2, :if => "option2_text.blank?"
  
  validates :correct_answer ,:presence=>true
=begin  
  def validate
    unless option1_text_check || option2_text_check || option3_text_check || option4_text_check || option5_text_check
      errors.add_to_base "at least one checkbox from answer1,  or answer2 or answer3 or answer4 or answer5 must be checked"
    end
  end
=end  
  
  has_attached_file :question, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  has_attached_file :option1, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  has_attached_file :option2, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  has_attached_file :option3, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  has_attached_file :option4, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  has_attached_file :option5, :styles => { :medium => "300x300>", :thumb => "100x100>" }

end
