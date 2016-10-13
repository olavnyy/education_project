# Create Superadmin
FactoryGirl.create(:superadmin)

Group.create(name: "a")

Album.create(title: "Dogs",
            image: "dog.png",
            imageable_type: "Group",
            imageable_id: 1)

Album.create(title: "Horses",
            image: "horse.jpg",
            imageable_type: "Group",
            imageable_id: 1)

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
  FactoryGirl.create(:admin)
  FactoryGirl.create(:student)
end
