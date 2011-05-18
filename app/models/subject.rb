class Subject < ActiveRecord::Base
	has_many :questionbanks,:dependent=>:destroy
  validates :name, :presence => true
end
