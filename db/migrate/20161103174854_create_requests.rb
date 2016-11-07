class CreateRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :requests do |t|
      t.string :name
      t.string :address
      t.string :email
      t.string :contact_phone
      t.string :admin_fname
      t.string :admin_lname
      t.string :admin_email
      t.string :admin_contact_phone

      t.timestamps
    end
  end
end
