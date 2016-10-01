class CreateNews < ActiveRecord::Migration[5.0]
  def change
    create_table :news do |t|
      t.string :title
      t.string :description
      t.string :viewable_type
      t.integer :viewable_id
      t.references :viewable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
