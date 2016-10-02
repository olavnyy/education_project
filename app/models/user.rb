class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :registerable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, presence: true, length: {maximum: 25}
  validates :last_name, presence: true, length: {maximum: 25}

  phone_regex = /\A\+?\d{3}\s?(\(|)\d{2}(\)|)\s?\d{3}\s?\d{2}\s?\d{2}\s?\z/x
  validates :contact_phone, presence: true,
                  format: { with: phone_regex }

  # Define type of user (for app/models/ability.rb)
  def superadmin?
    self.type == 'Superadmin'
  end

  def admin?
    self.type == 'Admin'
  end

  def teacher?
    self.type == 'Teacher'
  end

  def parent?
    self.type == 'Parent'
  end
end
