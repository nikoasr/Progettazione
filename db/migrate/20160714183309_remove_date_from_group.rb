class RemoveDateFromGroup < ActiveRecord::Migration
  def change
    remove_column :groups, :date, :date
  end
end
