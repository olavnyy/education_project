class AddColumnImageInNews < ActiveRecord::Migration[5.0]
  def change
    add_column :news, :image, :string
  end
end
