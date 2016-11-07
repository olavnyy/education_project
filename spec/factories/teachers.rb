FactoryGirl.define do
  factory :teacher do

    sequence(:first_name) { |n| "Teacher#{n}" }
    sequence(:last_name) { |n| "surTeacher#{n}" }
    sequence(:email) { |n| "teacher#{n}@teacher.com" }
    password 'password'
    password_confirmation 'password'
    type 'Teacher'
    sequence(:school_id) { |n| "#{n}" }
    sequence(:group_id) { |n| "#{n}" }
    contact_phone '+123456733012'
  end
end
