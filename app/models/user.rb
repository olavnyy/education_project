class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :registerable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, presence: true, length: {maximum: 25}
  validates :last_name, presence: true, length: {maximum: 25}

  valid_phone_regex = /(\d{3}|\(\d{3}\))(.|)\d{3}(.|)\d{4}/x
  validates :contact_phone, presence: true,
                  format: { with: valid_phone_regex }
end
