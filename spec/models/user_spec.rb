require 'rails_helper'

RSpec.describe User, type: :model do
  require 'rails_helper'

  it "creates a valid model" do
     user = User.new(
        first_name: 'firstname',
        last_name: 'lastname',
        email: "zoryana94@bigmir.net",
        password: "winter",
        password_confirmation: "winter",
        contact_phone: "+380 (93) 299 64 34",
        type: "Teacher"
        )
     expect(user).to be_valid
  end

  it "is invalid without the first_name" do
     user = User.new(first_name: nil)
     user.valid?
     expect(user.errors[:first_name]).to include("can't be blank")
  end

  it "is invalid without the last_name" do
     user = User.new(last_name: nil)
     user.valid?
     expect(user.errors[:last_name]).to include("can't be blank")
  end

  it "is invalid without the contact_phone" do
     user = User.new(contact_phone: nil)
     user.valid?
     expect(user.errors[:contact_phone]).to include("can't be blank")
  end

  it "is invalid when the first_name is longer" do
    user = User.new(first_name: "a"*26)
    user.valid?
    expect(user.errors[:first_name])
  end

  it "is invalid when the last_name is longer" do
    user = User.new(last_name: "a"*26)
    user.valid?
    expect(user.errors[:last_name])
  end

    it "is invalid because of contact phone format" do
     user = User.new(contact_phone: "+380 93 2996434 222222")
     user.valid?
     expect(user.errors[:contact_phone])
  end

end
