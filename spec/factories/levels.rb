FactoryGirl.define do
  factory :level do
    name "MyString"
  end

  factory :invalid_level, parent: :level do
    name "asodfknaosdnfosadnfo"
  end
end
