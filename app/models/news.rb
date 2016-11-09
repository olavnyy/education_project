class News < ApplicationRecord
  belongs_to :imageable, polymorphic: true
  belongs_to :user

  VALID_TITLE_REGEX = /[\w\s\.][^\d]/i # any digit  is not permitted
  VALID_CONTENT_REGEX = /[^~`!@#$%^&*()_-]/i # any symbol  is not permitted
  validates :title, presence: true, length: { maximum: 50 },
            format: { with: VALID_TITLE_REGEX }
  validates :description, presence: true, length: { maximum: 512 },
            format: { with: VALID_CONTENT_REGEX }

  has_attached_file :image, styles: { medium: "500x140>", thumb: "70x70>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
