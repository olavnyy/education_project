class News < ApplicationRecord
  belongs_to :imageable, polymorphic: true

  VALID_TITLE_REGEX = /[\w\s\.][^\d]/i # any digit  is not permitted
  VALID_CONTENT_REGEX = /[^~`!@#$%^&*()_-]/i # any symbol  is not permitted
  validates :title, presence: true, length: { maximum: 50 },
            format: { with: VALID_TITLE_REGEX }
  validates :description, presence: true, length: { maximum: 512 },
            format: { with: VALID_CONTENT_REGEX }
end
