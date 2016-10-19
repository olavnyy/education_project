FactoryGirl.define do
  factory :album do
    sequence :title do |n|
      "Album #{n}"
    end
    image "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcQSpyafEqJwu7iXv3deAkDbyZ-wklcQlAxGxei-Z8kWKEjeDvOVhA"
    sequence :imageable_id do |n|
      "#{n}"
    end
    imageable_type "Group"
  end
end

