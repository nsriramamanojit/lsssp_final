class Examination < ActiveRecord::Base
  #  has_and_belongs_to_many :userexaminations
  validates :examname,:duration,:passmarks,:positivemarks, :presence => true
  validates_numericality_of :passmarks,:positivemarks,:duration,:greater_than_or_equal_to=>1
  
  validates_numericality_of :negativemarks,:notattemptmarks,:greater_than_or_equal_to=>0
  
 
end
