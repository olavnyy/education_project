class ChangeColumnNameInNews < ActiveRecord::Migration[5.0]
  def change
    change_table :news do |t|
      t.rename :viewable_type, :imageable_type
      t.rename :viewable_id, :imageable_id
    end
  end
end
