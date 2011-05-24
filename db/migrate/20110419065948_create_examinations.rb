class CreateExaminations < ActiveRecord::Migration
  def self.up
    create_table :examinations do |t|

      t.string  :examname
      t.integer :duration
      t.string  :module_questions
      t.integer :positivemarks
      t.integer :negativemarks,:default=>0
      t.integer :notattemptmarks,:default=>0
      t.integer :passmarks

      t.timestamps
    end
  end

  def self.down
    drop_table :examinations
  end
end
