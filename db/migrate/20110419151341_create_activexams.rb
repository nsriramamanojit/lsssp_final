class CreateActivexams < ActiveRecord::Migration
  def self.up
    create_table :activexams do |t|

	  t.integer :user_id
	  t.integer :examination_id
	  t.integer :subject_id
	  t.integer :question_id
	  t.integer :answer
      t.integer :time_remain

      t.timestamps
    end
  end

  def self.down
    drop_table :activexams
  end
end
