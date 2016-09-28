class CreateParentsStudentsJoinTable < ActiveRecord::Migration[5.0]
  def change
    create_join_table :users, :students, table_name: :parents_students do |t|
      t.index :user_id
      t.index :student_id
    end
  end
end
