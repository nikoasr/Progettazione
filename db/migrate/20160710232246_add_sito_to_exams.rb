class AddSitoToExams < ActiveRecord::Migration
  def change
    add_column :exams, :sito, :string
  end
end
