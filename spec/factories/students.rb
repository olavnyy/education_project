FactoryGirl.define do
  factory :student do
    sequence(:first_name) { |n| "Student#{n}" }
    sequence(:last_name) { |n| "Surname#{n}" }
    age 4
    school_id 1
    group_id 1
  end
end
