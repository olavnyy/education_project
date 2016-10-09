require 'rails_helper'

  describe News do
    before do
      @news1 = News.new(title: "First News", description: "This is new text")
  end

  it { should respond_to(:title) }
  it { should respond_to(:description) }

  subject { @news1 }

  describe "when title is not present" do
    before { @news1.title = " " }
    it { should_not be_valid }
  end

  describe "when description is not present" do
    before { @news1.description = " " }
    it { should_not be_valid }
  end

  describe "when title is too long" do
    before { @news1.title = "a" * 51 }
    it { should_not be_valid }
  end

  describe "when description is too long" do
    before { @news1.description = "a" * 513 }
    it { should_not be_valid }
  end

  describe "when title format is valid" do
    it "should be valid" do
      valid_title = /[\w\s\.][^\d]/i
      @news1.title = valid_title
      expect(@news1).to be_valid
    end
  end

  describe "when description format is valid" do
    it "should be valid" do
      valid_description = /[^~`!@#$%^&*()_-]/i
      @news1.description = valid_description
      expect(@news1).to be_valid
    end
  end
end