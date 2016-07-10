class AddAnnoToExams < ActiveRecord::Migration
  def change
    add_column :exams, :anno, :string
  end
end
