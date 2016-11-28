class AddReferenceToMyDays < ActiveRecord::Migration[5.0]
  def change
    add_reference :my_days, :group, index: true, foreign_key: true
  end
end
