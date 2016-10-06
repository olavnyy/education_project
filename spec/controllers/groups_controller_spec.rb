require 'rails_helper'

RSpec.describe GroupsController, type: :controller do
  describe "GET #index" do
    it 'index success' do
      get :index
      expect(response.status).to eq(200)
      expect(response.content_type).to eq 'application/json'
    end
  end

  describe "GET #show" do
    before do
      @group = FactoryGirl.create(:group)
      @try = FactoryGirl.create(:group, nil)
    end

    it 'show success' do
      get :show, params: { id: 1 }
      expect(response.status).to eq(200)
      expect(response.content_type).to eq 'application/json'
    end
  end

  describe "CREATE #create" do
    it 'creates group success' do
      post :create, group: FactoryGirl.attributes_for(:group)
      expect(response.status).to eq(200)
      expect(response.content_type).to eq 'application/json'
    end

    it "creates a new group" do
      expect {
        post :create, group: FactoryGirl.attributes_for(:group)
      }.to change(Group, :count).by(1)
      expect(response.status).to eq(200)
    end
  end

  describe "PATCH/PUT #update" do
    before :each do
      @group = FactoryGirl.create(:group, name: 'GroupLV')
    end

    it "located the requested @group" do
      put :update, id: @group, group: FactoryGirl.attributes_for(:group, id: 100)
      expect(response.status).to eq(200)
      expect(response.content_type).to eq 'application/json'
    end
  end

  describe 'DELETE #destroy' do
    before :each do
      @group = FactoryGirl.create(:group)
    end

    it "deletes the group" do
      expect{
        delete :destroy, id: @group
      }.to change(Group,:count).by(-1)
    end

    it "redirects to group#index" do
      delete :destroy, id: @group
      expect(response.status).to eq(200)
    end
  end
end
