class AddStudentIdToHealthInfo < ActiveRecord::Migration[5.0]
  def change
    add_column :health_infos, :student_id, :integer
  end
end
