class AddGroupIdToAttendances < ActiveRecord::Migration[5.0]
  def change
    add_column :attendances, :group_id, :integer
    add_index :attendances, :group_id
  end
end
