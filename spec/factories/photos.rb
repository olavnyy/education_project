FactoryGirl.define do
  factory :photo do
    image_file_name { 'http://1030news.com/wp-content/themes/fearless/images/missing-image-640x360.png' }
    image_content_type { 'image/png' }
    image_file_size { 1024 }
    sequence :album_id do |n|
      "#{n}"
    end
  end
end
