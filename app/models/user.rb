class User < ActiveRecord::Base
  acts_as_authentic

  has_many :assignments
  has_many :roles, :through => :assignments
  
  validates_presence_of :mobile_number, :message=>"Primary Contact Number"
  #validates :phone_number, :presence => true

  validates :first_name, :presence => true
  validates :last_name, :presence =>true
  validates_presence_of :password, :password_confirmation
  validates_confirmation_of :password
  
  def role_symbols
    roles.map do |role|
      role.name.underscore.to_sym
    end
  end

  def self.search(search)
    if search
      where({:email.matches => "%#{search}%"} | {:first_name.matches => "%#{search}%"} |
     {:last_name.matches => "%#{search}%"} | {:enrollment_number.matches => "%#{search}%"} )
    else
      scoped
    end
  end

  def deliver_password_reset_instructions!
    reset_perishable_token!
    Notifier.deliver_password_reset_instructions(self)
  end

end

