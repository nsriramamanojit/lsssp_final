class User < ActiveRecord::Base
 acts_as_authentic
 
  has_many :assignments
  has_many :roles, :through => :assignments

#validates :mobile_number, :presence => true
#validates :phone_number, :presence => true

validates :first_name, :presence => true
validates :last_name, :presence =>true

  def role_symbols
    roles.map do |role|
      role.name.underscore.to_sym
    end
  end

end

