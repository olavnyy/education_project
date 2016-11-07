require 'rails_helper'

RSpec.describe HealthInfo, type: :model do
  before do
    @health_info = HealthInfo.new(health_problem: 'Allergy',
                                  description: "The child shouldn\'t eat nuts",
                                  student_id: 1)
  end

  it 'HealthInfo should be valid' do
    expect(@health_info).to be_valid
  end

  it 'health_problem should not be blank' do
    expect(:health_problem).not_to be_empty
  end
end
