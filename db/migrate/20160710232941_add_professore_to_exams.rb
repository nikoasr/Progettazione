class AddProfessoreToExams < ActiveRecord::Migration
  def change
    add_column :exams, :professore, :string
  end
end
