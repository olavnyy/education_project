class CreateLevels < ActiveRecord::Migration[5.0]
  def change
    create_table :levels do |t|
      t.string :name

      t.timestamps
    end
    add_reference :levels, :school, index: true, foreign_key: true
  end
end
