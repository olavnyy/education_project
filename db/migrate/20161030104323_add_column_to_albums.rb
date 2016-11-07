class AddColumnToAlbums < ActiveRecord::Migration[5.0]
  def change
    add_reference :albums, :school, index: true, foreign_key: true
  end
end
