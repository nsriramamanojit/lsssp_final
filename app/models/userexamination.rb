class Userexamination < ActiveRecord::Base
	belongs_to :examination
  belongs_to :user
  validates_uniqueness_of :examination_id, :scope => :user_id
#    has_and_belongs_to_many :examinations
end
