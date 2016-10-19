FactoryGirl.define do
  factory :admin do
    sequence(:first_name) { |n| "Admin#{n}" }
    sequence(:last_name) { |n| "surAdmin#{n}" }
    sequence(:email) { |n| "admin#{n}@admin.com" }
    password 'password'
    password_confirmation 'password'
    type 'Admin'
    sequence(:school_id) { |n| "#{n}" }
    contact_phone '+123456789012'
  end
end
