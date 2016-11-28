FactoryGirl.define do
  factory :group do
    sequence :name do |n|
      "group_#{n}"
    end
    sequence(:level_id) {|n| n}
    sequence(:school_id) {|n| n}
  end
end
