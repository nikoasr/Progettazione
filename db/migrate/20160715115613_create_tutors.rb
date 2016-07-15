class CreateTutors < ActiveRecord::Migration
  def change
    create_table :tutors do |t|
      t.integer :user_id
      t.integer :exam_id
      t.string :cel
      t.string :email

      t.timestamps null: false
    end
  end
end
