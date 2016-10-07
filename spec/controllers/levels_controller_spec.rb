require 'rails_helper'

RSpec.describe LevelsController, type: :controller do

  describe "GET #index" do
    it 'index success' do
      get :index
      expect(response.status).to eq(200)
      expect(response.content_type).to eq 'application/json'
    end
  end

  describe "GET #show" do
    before do
      @level = FactoryGirl.create(:level)
      @try = FactoryGirl.create(:level, nil)
    end

    it 'show success' do
      get :show, params: { id: 1 }
      expect(response.status).to eq(200)
      expect(response.content_type).to eq 'application/json'
    end
  end

  describe "CREATE #create" do
    it 'creates level success' do
      post :create, level: FactoryGirl.attributes_for(:level)
      expect(response.status).to eq(200)
      expect(response.content_type).to eq 'application/json'
    end

    it "creates a new level" do
      expect {
        post :create, level: FactoryGirl.attributes_for(:level)
      }.to change(Level, :count).by(1)
      expect(response.status).to eq(200)
    end
  end

  describe "PATCH/PUT #update" do
    before :each do
      @level = FactoryGirl.create(:level, name: 'GroupLV')
    end

    it "located the requested @level" do
      put :update, id: @level, level: FactoryGirl.attributes_for(:level, id: 100)
      expect(response.status).to eq(200)
      expect(response.content_type).to eq 'application/json'
    end
  end

  describe 'DELETE #destroy' do
    before :each do
      @level = FactoryGirl.create(:level)
    end

    it "deletes the level" do
      expect{
        delete :destroy, id: @level
      }.to change(Level,:count).by(-1)
    end

    it "redirects to level#index" do
      delete :destroy, id: @level
      expect(response.status).to eq(200)
    end
  end
end
