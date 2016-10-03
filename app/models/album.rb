class Album < ApplicationRecord
  belongs_to :imageable, polymorphic: true
end
