FactoryGirl.define do
  factory :level do
    sequence :name do |n|
      "level_#{n}"
    end
  end

  factory :invalid_level, parent: :level do
    name "asodfknaosdnfosadnfo"
  end
end
