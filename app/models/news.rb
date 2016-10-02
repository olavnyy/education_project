class News < ApplicationRecord
  belongs_to :viewable, polymorphic: true
end
