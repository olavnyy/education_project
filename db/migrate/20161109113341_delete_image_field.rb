class DeleteImageField < ActiveRecord::Migration[5.0]
  def change
    remove_column :news, :image, :string
  end
end
