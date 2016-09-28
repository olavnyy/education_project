class AddColumnsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :contact_phone, :string
    add_column :users, :type, :string
    add_reference :users, :school, index: true, foreign_key: true
    add_reference :users, :group, index: true, foreign_key: true
  end
end
