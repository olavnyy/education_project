require 'spec_helper'

######Testing GET methods######

describe "GET #show" do
    before(:each) do
    @school = FactoryGirl.create :school
    end

 describe "GET #new" do
    it "should be successful" do
      get :new
      response.should be_success
    end
  end
end

describe "GET #index" do
  it "creates an array of schools" do
    @school = FactoryGirl.create :school
    get :index
    assigns(:schools).should eq(@school)
  end
end

describe "GET #show" do
  it "assigns the requested school to @school" do
    @school = FactoryGirl.create :school
    get :show, id: school
    assigns(:school).should eq(@school)
  end
end

######Testing POST methods######

describe "POST #create" do
  context "with valid attributes" do
    it "creates a new school" do
      expect{
        post :create, school: FactoryGirl.attributes_for(:school)
      }.to change(School,:count).by(1)
    end

    it "redirects to the new contact" do
      post :create, school: FactoryGirl.attributes_for(:school)
      response.should redirect_to School.last
    end
  end
end

#####Testing PUT methods######

describe 'PUT #update' do
  before :each do
    @school = Factory(:school, name: "Another School", email: "another@mail.gb", address: "Oslo", contact_phone: "0987654321")
  end

  context "valid attributes" do
    it "located the requested @school" do
      put :update, id: @school, school: FactoryGirl.attributes_for(:school)
      assigns(:school).should eq(@school)
    end

    it "changes @school's attributes" do
      put :update, id: @school,
        school: FactoryGirl.attributes_for(:school, name: "Another School", email: "another@mail.gb", address: "Oslo", contact_phone: "0987654321")
      @school.reload
      @school.name.should eq("Another School")
      @school.email.should eq("another@mail.gb")
      @school.address.should eq("Oslo")
      @school.contact_phone.should eq("0987654321")
    end

    it "redirects to the updated school" do
      put :update, id: @school, school: FactoryGirl.attributes_for(:school)
      response.should redirect_to @school
    end
  end
end

######Testing DELETE methods######

describe 'DELETE destroy' do
  before :each do
    @school = FactoryGirl.create :school
  end

  it "deletes the school" do
    expect{
      delete :destroy, id: @school
    }.to change(School,:count).by(-1)
  end

  it "redirects to schools#index" do
    delete :destroy, id: @school
    response.should redirect_to schools_url
  end
end