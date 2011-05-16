class CreateUserexaminations < ActiveRecord::Migration
  def self.up
    create_table :userexaminations do |t|

      t.integer :user_id
      t.string  :examination_id
      t.boolean :exam_active_status, :default =>0
      t.integer :number_of_attempts, :default =>0
      t.boolean :exam_complete_status, :default =>0
      t.integer :duration
      t.integer :time_remain
	  t.integer :no_of_questions
      t.integer :questions_answered
	  t.integer :total_score

      t.timestamps
    end
  end

  def self.down
    drop_table :userexaminations
  end
end
