require 'rails_helper'

RSpec.configure do |config|
  config.include Devise::Test::ControllerHelpers, type: :controller
end

RSpec.describe StudentsController, type: :controller do
  before(:each) do
    @student = Student.new(id: 1,
                           first_name: 'Adam',
                           last_name: 'Smith',
                           age: 4,
                           school_id: 1,
                           group_id: 1)
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
