FactoryGirl.define do
  factory :news do
    sequence(:title) { |n| "Title  #{n}" }
    sequence(:description) { |n| "Description #{n}" }
    viewable_type "School"
    sequence(:viewable_id ) { |n| "#{n}" }
  end
end
