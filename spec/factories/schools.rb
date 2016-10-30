FactoryGirl.define do
  factory :school do
    name "Lviv_schoool"
    sequence(:email) { |n| "#{n}@examplee.com" }
    address "Ukraine"
    contact_phone "123456789"
  end
end