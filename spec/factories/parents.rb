FactoryGirl.define do
  factory :parent do

    first_name "Lviv_schoool"
    last_name "svdfgbf"
    password "123456qwer"
    password_confirmation "123456qwer"
    sequence(:email) { |n| "#{n}@examplew.com" }
    contact_phone "+123456789012"
    school_id 1
  end
end