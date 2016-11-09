class Request < ApplicationRecord
	validates :name, presence: true, length: { maximum: 80 }
	validates :address, presence: true
	validates :email, presence: true, length: { maximum: 50 }
	validates :contact_phone, presence: true, length: { maximum: 13 }
	validates :admin_fname, presence: true, length: { maximum: 50 }
	validates :admin_lname, presence: true, length: { maximum: 50 }
	validates :admin_email, length: { maximum: 50 }
	validates :admin_contact_phone, length: { maximum: 13 }
	validates :additionalinfo, length: { maximum: 1000 }
end
