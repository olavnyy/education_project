class CreateStudents < ActiveRecord::Migration[5.0]
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.integer :age

      t.timestamps
    end
    add_reference :students, :school, index: true, foreign_key: true
    add_reference :students, :group, index: true, foreign_key: true
  end
end
