require 'rails_helper'

RSpec.configure do |config|
  config.include Devise::Test::ControllerHelpers, type: :controller
end

RSpec.describe AlbumsController, type: :controller do

  before(:each) do
    @album = FactoryGirl.create(:album)
  end

  describe "GET #index" do
    it "should be successful" do
      process :index, method: :get
      expect(response).to be_success
      expect(response).to have_http_status(200)
      expect(response.content_type).to eq "application/json"
    end

  end

  describe "GET #show" do
    it "should be successful" do
      process :show, method: :get, params: { id: @album }
      expect(response).to be_success
      expect(response).to have_http_status(200)
      expect(response.content_type).to eq "application/json"
    end
  end

  describe "GET #new" do
    it "should be successful" do
      process :new, method: :get
      expect(response).to be_success
      expect(response).to have_http_status(200)
      expect(response).to render_template "new"
    end
  end

  describe "POST #create" do

    context "with good data" do
      it "creates the album" do
        process :create, method: :post, params: {id: @album.id, album: {
                                                  title: "Created Title",
                                                  image: "new_img.png"}}
        expect(response).to be_success
        expect(response).to have_http_status(200)
        expect(response.content_type).to eq "application/json"
      end
    end

    context "with bad data" do
      it "does not create the album" do
        process :create, method: :post, params: {id: @album.id, album: { title: ""}}
        expect(response).to be_success
        expect(response).to have_http_status(200)
        expect(response).to render_template "new"
      end
    end

  end

  describe "GET #edit" do
    it "should be successful" do
      process :edit, method: :get, params: {id: @album}
      expect(response).to be_success
      expect(response).to have_http_status(200)
      expect(response).to render_template "edit"
    end
  end

  describe "PATCH #update" do

    context "with good data" do
      it "updates the album" do
        process :update, method: :patch, params: {id: @album.id, album: {
                                                  title: "Updated Title",
                                                  image: "new_img.png"}}
        expect(response).to be_success
        expect(response).to have_http_status(200)
        expect(response.content_type).to eq "application/json"
      end
    end

    context "with bad data" do
      it "does not change the album" do
        process :update, method: :patch, params: {id: @album.id, album: { title: ""}}
        expect(response).to be_success
        expect(response).to have_http_status(200)
        expect(response).to render_template "edit"
      end
    end

  end

  describe "DELETE #destroy" do
    it "should be successful" do
      process :destroy, method: :delete, params: { id: @album }
      expect(response).to be_success
      expect(response).to have_http_status(200)
      expect(response.content_type).to eq "application/json"
    end
  end

end


