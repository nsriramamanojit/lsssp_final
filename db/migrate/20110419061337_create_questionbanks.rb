class CreateQuestionbanks < ActiveRecord::Migration
  def self.up
    create_table :questionbanks do |t|

      t.integer :subject_id
      t.string  :question_option
      t.string  :question_type
      t.text    :question_text
      t.string  :question_imagepath
      t.boolean :option1_text_check
      t.boolean :option2_text_check
      t.boolean :option3_text_check
      t.boolean :option4_text_check
      t.boolean :option5_text_check
      t.text    :option1_text
      t.text    :option2_text
      t.text    :option3_text
      t.text    :option4_text
      t.text    :option5_text
      t.boolean :option1_image_check
      t.boolean :option2_image_check
      t.boolean :option3_image_check
      t.boolean :option4_image_check
      t.boolean :option5_image_check
      t.text    :option1_imagepath
      t.text    :option2_imagepath
      t.text    :option3_imagepath
      t.text    :option4_imagepath
      t.text    :option5_imagepath
      t.text    :question_image_file_name
      t.timestamps
    end
  end

  def self.down
    drop_table :questionbanks
  end
end
