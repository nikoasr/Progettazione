class AddExamIdToMembers < ActiveRecord::Migration
  def change
    add_column :members, :exam_id, :integer
  end
end
