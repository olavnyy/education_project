FactoryGirl.define do
  factory :superadmin do
    first_name 'Super'
    last_name 'Admin'
    email 'sa@sa.com'
    password 'superadmin'
    password_confirmation 'superadmin'
    type 'Superadmin'
    contact_phone '+123456789012'
  end
end
