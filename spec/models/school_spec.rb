require 'rails_helper'

describe School do

  before { @school = School.new(name: "Lviv School", email: "school@example.com", address: "Ukraine", contact_phone: "1234567890") }

  subject { @school }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:address) }
  it { should respond_to(:contact_phone) }

  it { should be_valid }

#**********Tests for presence**********
  describe "when name is not present" do
    before { @school.name = " " }
    it { should_not be_valid }
  end

  describe "when email is not present" do
    before { @school.email = " " }
    it { should_not be_valid }
  end

  describe "when address is not present" do
    before { @school.address = " " }
    it { should_not be_valid }
  end

  describe "when contact phone is not present" do
    before { @school.contact_phone = " " }
    it { should_not be_valid }
  end

#**********Tests for length**********
  describe "when name is too long" do
    before { @school.name = "a" * 51 }
    it { should_not be_valid }
  end

    describe "when email is too long" do
    before { @school.email = "a" * 256 }
    it { should_not be_valid }
  end

  describe "when phone is too long" do
    before { @school.contact_phone = "1" * 14 }
    it { should_not be_valid }
  end

#**********Tests for format**********

  #*****Tests for email format*****

  describe "when email format is invalid" do
    it "should be invalid" do
      addresses = %w[school@foo,com school_at_foo.org example.school@foo.
                     foo@bar_baz.com foo@bar+baz.com]
      addresses.each do |invalid_address|
        @school.email = invalid_address
        expect(@school).not_to be_valid
      end
    end
  end

  describe "when email format is valid" do
    it "should be valid" do
      addresses = %w[school@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        @school.email = valid_address
        expect(@school).to be_valid
      end
    end
  end
end