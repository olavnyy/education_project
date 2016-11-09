require 'rails_helper'

RSpec.configure do |config|
  config.include Devise::Test::ControllerHelpers, type: :controller
end

RSpec.describe SchoolsController, type: :controller do
  before(:each) do
    @school = School.new(id: 1,
                         name: 'School_1',
                         address: 'Lviv',
                         email: 'qw@qw.com',
                         contact_phone: '12132114325')
  end

  describe 'GET #index' do
    it 'should be successful' do
      process :index, method: :get
      expect(response).to be_success
      expect(response).to have_http_status(200)
      expect(response.content_type).to eq 'application/json'
    end
  end
end