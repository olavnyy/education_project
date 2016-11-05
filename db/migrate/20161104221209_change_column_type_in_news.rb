class ChangeColumnTypeInNews < ActiveRecord::Migration[5.0]
  def up
      change_column :news, :description, :text
  end
  def down
      change_column :news, :description, :string
  end
end
