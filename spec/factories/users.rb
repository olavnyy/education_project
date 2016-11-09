FactoryGirl.define do
  factory :user do
    sequence(:first_name) { |n| "User#{n}" }
    sequence(:last_name) { |n| "surUser#{n}" }
    sequence(:email) { |n| "user#{n}@user.com" }
    password 'password'
    password_confirmation 'password'
    type 'User'
    contact_phone '+123456789012'
  end
end
