FactoryGirl.define do
  factory :group do
    sequence :name do |n|
      "group_#{n}"
    end
  end
end
