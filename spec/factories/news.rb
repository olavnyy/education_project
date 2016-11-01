FactoryGirl.define do
  factory :news do
    sequence(:title) { |n| "Title  #{n}" }
    sequence(:description) { |n| "Description #{n}" }
    imageable_type "School"
    sequence(:imageable_id ) { |n| "#{n}" }
  end
end
