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
            image: "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcQSpyafEqJwu7iXv3deAkDbyZ-wklcQlAxGxei-Z8kWKEjeDvOVhA",
            imageable_type: "Group",
            imageable_id: 1)

Album.create(title: "Horses",
            image: "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcRMDRaI_pMFEXZx_pTyzd9Zc9pQ-DYERkI-OnrknH8BQKrlCt_1dw",
            imageable_type: "Group",
            imageable_id: 1)

Album.create(title: "Dogs2",
            image: "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcQSpyafEqJwu7iXv3deAkDbyZ-wklcQlAxGxei-Z8kWKEjeDvOVhA",
            imageable_type: "Level",
            imageable_id: 1)

10.times do |n|
  FactoryGirl.create(:album)
end

10.times do |n|
  FactoryGirl.create(:photo)
end

Photo.create(image_file_name: "horse.jpg",
            image_content_type: "image/jpeg",
            image_file_size: 999)

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
	FactoryGirl.create(:school)
end
