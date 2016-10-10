require 'rails_helper'

RSpec.describe SchoolsController, type: :controller do
  describe "GET #index" do
    it 'index success' do
      get :index
      expect(response.status).to eq(200)
      expect(response.content_type).to eq 'application/json'
    end
  end

  describe "GET #show" do
    before do
      @school = FactoryGirl.create(:school)
      @try = FactoryGirl.create(:school, nil)
    end

    it 'show success' do
      get :show, params: { id: 1 }
      expect(response.status).to eq(200)
      expect(response.content_type).to eq 'application/json'
    end
  end

  describe "CREATE #create" do
    it 'creates school success' do
      post :create, school: FactoryGirl.attributes_for(:school)
      expect(response.status).to eq(200)
      expect(response.content_type).to eq 'application/json'
    end

    it "creates a new school" do
      expect {
        post :create, school: FactoryGirl.attributes_for(:school)
      }.to change(School, :count).by(1)
      expect(response.status).to eq(200)
    end
  end

  describe "PATCH/PUT #update" do
    before :each do
      @school = FactoryGirl.create(:school, name: 'SchoolLV')
    end

    it "located the requested @school" do
      put :update, id: @school, school: FactoryGirl.attributes_for(:school, id: 100)
      expect(response.status).to eq(200)
      expect(response.content_type).to eq 'application/json'
    end
  end

  describe 'DELETE #destroy' do
    before :each do
      @school = FactoryGirl.create(:school)
    end

    it "deletes the school" do
      expect{
        delete :destroy, id: @school
      }.to change(School,:count).by(-1)
    end

    it "redirects to school#index" do
      delete :destroy, id: @school
      expect(response.status).to eq(200)
    end
  end
end