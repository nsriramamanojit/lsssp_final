class Examination < ActiveRecord::Base
#  has_and_belongs_to_many :userexaminations
validates :examname, :presence => true
validates :duration, :presence => true

end
