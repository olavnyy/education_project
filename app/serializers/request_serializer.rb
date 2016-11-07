class RequestSerializer < ActiveModel::Serializer
  attributes :id, :name, :address, :email, :contact_phone, 
	  		 :admin_fname, :admin_lname, :admin_email, :admin_contact_phone,
	  		 :additionalinfo
end
