require 'rails_helper'

RSpec.describe Group, type: :model do

  it "creates a valid model" do
    group = Group.new(name: 'a')
    expect(group).to be_valid
  end

  it "is invalid without the name" do
    group = Group.new(name: nil)
    group.valid?
    expect(group.errors[:name]).to include("can't be blank")
  end

  it "is invalid when the name is longer" do
    group = Group.new(name: "a"*11)
    group.valid?
    expect(group.errors[:name])
  end

end
