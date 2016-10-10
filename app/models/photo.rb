# frozen_string_literal: true
class Photo < ApplicationRecord
    belongs_to :album
    has_attached_file :image, styles: { large: '600x600>', medium: '300x300>', thumb: '100x100>' },
                              path: ":rails_root/public/images/:id/:filename",
                              url: "/images/:id/:filename"
    validates_attachment :image, presence: true,
                                 size: { in: 0..2000.kilobytes },
                                 content_type: { content_type: /^image\/(png|gif|jpeg|jpg)/ },
                                 message: "Only (png|gif|jpeg|jpg) images are allowed and the size cannot exceed 5Mb"

end
