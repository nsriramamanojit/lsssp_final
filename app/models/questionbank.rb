class Questionbank < ActiveRecord::Base
	belongs_to :subject
    belongs_to :activexam
    
	has_attached_file :question, :styles => { :medium => "300x300>", :thumb => "100x100>" }
	has_attached_file :option1, :styles => { :medium => "300x300>", :thumb => "100x100>" }
	has_attached_file :option2, :styles => { :medium => "300x300>", :thumb => "100x100>" }
	has_attached_file :option3, :styles => { :medium => "300x300>", :thumb => "100x100>" }
	has_attached_file :option4, :styles => { :medium => "300x300>", :thumb => "100x100>" }
end
