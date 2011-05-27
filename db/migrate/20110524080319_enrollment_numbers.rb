class EnrollmentNumbers < ActiveRecord::Migration
  def self.up
    add_column :users, :enrollment_number, :string
  end

  def self.down
    remove_column :users, :enrollment_number
  end
end
