FactoryGirl.define do
  factory :level do
    sequence :name do |n|
      "level_#{n}"
    end
    sequence(:school_id) {|n| n}
  end
end
