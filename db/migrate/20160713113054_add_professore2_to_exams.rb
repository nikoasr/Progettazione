class AddProfessore2ToExams < ActiveRecord::Migration
  def change
    add_column :exams, :professore2, :string
  end
end
