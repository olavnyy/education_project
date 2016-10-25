FactoryGirl.define do
  factory :health_info do
    sequence(:health_problem) { |n| "Allergy#{n}" }
    sequence(:description) { |n| "The child shouldn\'t eat #{n} nuts" }
    sequence(:student_id) { |n| "#{n}" }
  end
end
