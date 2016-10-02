class School < ApplicationRecord
  belongs_to :superadmin
  has_one :admin, dependent: :destroy
  has_many :parents, dependent: :destroy
  has_many :teachers, dependent: :destroy
  has_many :students, dependent: :destroy
  has_many :groups, dependent: :destroy
  has_many :levels, dependent: :destroy

  validates :name, presence: true, length: { maximum: 50 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }

  validates :address, presence: true

  VALID_PHONE_REGEX = /[0-9\-\+]/
  validates :contact_phone, presence: true, length: { maximum: 13 },
                            format: { with: VALID_PHONE_REGEX }
end