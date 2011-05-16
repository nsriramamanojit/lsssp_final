class QuestionImage < ActiveRecord::Migration
 def self.up
    add_column :questionbanks, :question_file_name,    :string
    add_column :questionbanks, :question_content_type, :string
    add_column :questionbanks, :question_file_size,    :integer
    add_column :questionbanks, :option1_file_name,    :string
    add_column :questionbanks, :option1_content_type, :string
    add_column :questionbanks, :option1_file_size,    :integer
    add_column :questionbanks, :option2_file_name,    :string
    add_column :questionbanks, :option2_content_type, :string
    add_column :questionbanks, :option2_file_size,    :integer
    add_column :questionbanks, :option3_file_name,    :string
    add_column :questionbanks, :option3_content_type, :string
    add_column :questionbanks, :option3_file_size,    :integer
    add_column :questionbanks, :option4_file_name,    :string
    add_column :questionbanks, :option4_content_type, :string
    add_column :questionbanks, :option4_file_size,    :integer

 end

  def self.down
    remove_column :questionbanks, :question_file_name,    :string
    remove_column :questionbanks, :question_content_type, :string
    remove_column :questionbanks, :question_file_size,    :integer
    remove_column :questionbanks, :option1_file_name,    :string
    remove_column :questionbanks, :option1_content_type, :string
    remove_column :questionbanks, :option1_file_size,    :integer
    remove_column :questionbanks, :option2_file_name,    :string
    remove_column :questionbanks, :option2_content_type, :string
    remove_column :questionbanks, :option2_file_size,    :integer
    remove_column :questionbanks, :option3_file_name,    :string
    remove_column :questionbanks, :option3_content_type, :string
    remove_column :quesitonbanks, :option3_file_size,    :integer
    remove_column :questionbanks, :option4_file_name,    :string
    remove_column :questionbanks, :option4_content_type, :string
    remove_column :questionbanks, :option4_file_size,    :integer


  end

end
