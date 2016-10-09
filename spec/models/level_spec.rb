require 'rails_helper'

RSpec.describe Level, type: :model do

  it "creates a valid model" do
    level = Level.new(name: '1')
    expect(level).to be_valid
  end

  it "is invalid without the name" do
    level = Level.new(name: nil)
    level.valid?
    expect(level.errors[:name]).to include("can't be blank")
  end

  it "is invalid when the name is longer" do
    level = Level.new(name: "a"*11)
    level.valid?
    expect(level.errors[:name])
  end

end
