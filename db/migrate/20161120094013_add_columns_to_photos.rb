class AddColumnsToPhotos < ActiveRecord::Migration[5.0]
  def change
  end
  add_reference :photos, :my_day, index: true, foreign_key: true
  add_reference :photos, :our_day, index: true, foreign_key: true
end
