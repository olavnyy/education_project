require 'rails_helper'

RSpec.describe PhotosController, type: :controller do

  before(:each) do
    @album = FactoryGirl.create(:album)
  end

  describe "GET #index" do
    it "should be successful" do
      process :index, method: :get, params: { album_id: @album }
      expect(response).to be_success
      expect(response).to have_http_status(200)
      expect(response.content_type).to eq "application/json"
    end
  end

end
