class CreateGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :groups do |t|
      t.string :name

      t.timestamps
    end
    add_reference :groups, :level, index: true, foreign_key: true
    add_reference :groups, :school, index: true, foreign_key: true
  end
end
