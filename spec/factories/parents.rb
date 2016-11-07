FactoryGirl.define do
  factory :parent do

    sequence(:first_name) { |n| "Parent#{n}" }
    sequence(:last_name) { |n| "surParent#{n}" }
    sequence(:email) { |n| "parent#{n}@gmail.com" }
    password 'password'
    password_confirmation 'password'
    type 'Parent'
    sequence(:school_id) { |n| "#{n}" }
    sequence(:group_id) { |n| "#{n}" }
    contact_phone '+123422789012'

  end
end
