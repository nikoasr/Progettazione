class CreateExams < ActiveRecord::Migration
  def change
    create_table :exams do |t|
      t.String :nome

      t.timestamps null: false
    end
  end
end
