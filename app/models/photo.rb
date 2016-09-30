# frozen_string_literal: true
class Photo < ApplicationRecord
    belongs_to :album
    has_attached_file :image, styles: { large: '600x600>', medium: '300x300>', thumb: '100x100>' },
                              default_url: '/images/:style/missing.png'
    validates_attachment :image, presence: true,
                                 content_type: { content_type: 'image/jpg' },
                                 size: { :in => 0..5000.kilobytes },
                                 content_type: /^image\/(png|gif|jpeg|jpg)/,
                                 message: "Only (png|gif|jpeg|jpg) images are allowed and the size cannot exceed 5Mb"

end
