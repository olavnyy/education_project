# Create Superadmin
User.create(first_name: 'Super',
            last_name: 'Admin',
            email: 'sa@sa.com',
            password: 'superadmin',
            password_confirmation: 'superadmin',
            type: 'Superadmin',
            contact_phone: '+123456789012')

Group.create(name: "a")

Album.create(title: "Dogs",
            image: "dog.png",
            imageable_type: "Group",
            imageable_id: 1)

Album.create(title: "Horses",
            image: "horse.jpg",
            imageable_type: "Group",
            imageable_id: 1)

5.times do |n|
  FactoryGirl.create(:level)
end

5.times do |n|
  FactoryGirl.create(:group)
end

5.times do |n|
  FactoryGirl.create(:news)
end
