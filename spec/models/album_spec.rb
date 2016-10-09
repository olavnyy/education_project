require 'rails_helper'

RSpec.describe Album, type: :model do

  it "creates a valid model" do
    album = Album.new(title: "Our class",
                      image: "class.png",
                      imageable_type: "Group",
                      imageable_id: 1)
    expect(album).to be_valid
  end

  it "is invalid without the title" do
    album = Album.new(title: nil)
    album.valid?
    expect(album.errors[:title]).to include("can't be blank")
  end


  it "is invalid when the name is longer" do
    album = Album.new(title: "a"*26)
    album.valid?
    expect(album.errors[:title])
  end
end
