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

School.create(name: "School Lviv",
            email: "lviv@ukr.com",
            address: "Lviv 2",
            contact_phone: "123456789")

School.create(name: "School IF",
            email: "if@ukr.com",
            address: "IF 2",
            contact_phone: "87438784378")

5.times do |n|
  FactoryGirl.create(:level)
end

5.times do |n|
  FactoryGirl.create(:group)
end

5.times do |n|
  FactoryGirl.create(:news)
end


5.times do |n|
    FactoryGirl.create(:student)
end

# Parent.create(first_name: "Qwer",
#             last_name: "Turiy",
#             email: "iddf@ukr.com",
#             contact_phone: 7438784378,
#             school_id: 2)

# Parent.create(first_name: "Yevgeniy",
#             last_name: "Kuriy",
#             email: "if@ukr.com",
#             contact_phone: 87438784378,
#             school_id: 1)

5.times do |n|
  FactoryGirl.create(:parent)
end

5.times do |n|
    FactoryGirl.create(:teacher)
end