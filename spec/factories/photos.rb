FactoryGirl.define do
  factory :photo do
    image_file_name { 'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcQSpyafEqJwu7iXv3deAkDbyZ-wklcQlAxGxei-Z8kWKEjeDvOVhA' }
    image_content_type { 'image/jpeg' }
    image_file_size { 1024 }
    sequence :album_id do |n|
      "#{n}"
    end
  end
end
