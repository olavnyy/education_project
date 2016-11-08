# frozen_string_literal: true
class Photo < ApplicationRecord
    belongs_to :album
    has_attached_file :image, styles: { large: '600x600>', medium: '300x300>', thumb: '100x100>' }, default_url: "images/missing.png"
    validates_attachment_content_type :image, presence: true,
                                              content_type: /\Aimage\/.*\Z/,
                                              size: { in: 0..2000.kilobytes }
end
