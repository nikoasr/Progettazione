class AddDatetimeToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :datetime, :datetime
  end
end
