class CreateExams < ActiveRecord::Migration
  def change
    create_table :exams do |t|
      t.string :nome

      t.timestamps null: false
    end
  end
end
