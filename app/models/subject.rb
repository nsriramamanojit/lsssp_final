class Subject < ActiveRecord::Base
	has_many :questionbanks,:dependent=>:destroy
end
