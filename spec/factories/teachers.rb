FactoryGirl.define do
  factory :teacher do

    first_name "Brandon"
    last_name "Flowers"
    password "123456qwer"
    password_confirmation "123456qwer"
    sequence(:email) { |n| "#{n}q@eeexample.com" }
    contact_phone "+123456789012"
    school_id 1
    group_id 2
  end
end