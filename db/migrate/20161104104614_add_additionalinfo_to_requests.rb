class AddAdditionalinfoToRequests < ActiveRecord::Migration[5.0]
  def change
    add_column :requests, :additionalinfo, :text
  end
end
