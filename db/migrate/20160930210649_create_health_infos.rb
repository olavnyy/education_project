class CreateHealthInfos < ActiveRecord::Migration[5.0]
  def change
    create_table :health_infos do |t|
      t.string :health_problem
      t.text :description

      t.timestamps
    end
  end
end
