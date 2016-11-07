class Request < ApplicationRecord

	validates :name, presence: true, length: { maximum: 80 }
	validates :address, presence: true
	validates :email, presence: true, length: { maximum: 50 },
										format: { with: VALID_EMAIL_REGEX }
	validates :contact_phone, presence: true, length: { maximum: 13 },
														format: { with: VALID_PHONE_REGEX }
	validates :admin_fname, presence: true, length: { maximum: 50 }
	validates :admin_lname, presence: true, length: { maximum: 50 }
	validates :admin_email, length: { maximum: 50 },
													format: { with: VALID_EMAIL_REGEX }
	validates :admin_contact_phone, length: { maximum: 13 }
	validates :additionalinfo, length: { maximum: 1000 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_PHONE_REGEX = /[0-9\-\+]/
end
