class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.date :date
      t.text :message
      t.integer :user_id
      t.integer :exam_id

      t.timestamps null: false
    end
  end
end
