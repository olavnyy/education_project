class CreateParentsStudentsJoinTable < ActiveRecord::Migration[5.0]
  def change
    create_table :students_users, id: false do |t|
      t.belongs_to :student, index: true
      t.belongs_to :parent, index: true
    end
  end
end
