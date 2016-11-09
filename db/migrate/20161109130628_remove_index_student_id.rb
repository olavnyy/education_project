class RemoveIndexStudentId < ActiveRecord::Migration[5.0]
  def change
    remove_column :journals, :student_id, :index
  end
end
