require 'rails_helper'

RSpec.describe Student, type: :model do
  before(:each) do
    @student = Student.new(first_name: 'Adam',
                           last_name: 'Smith',
                           age: 4,
                           school_id: 1,
                           group_id: 1)
  end

  it 'Student should be valid' do
    expect(@student).to be_valid
  end

  describe 'student first_name' do
    before { @student.first_name = 'a' * 18 }
    it 'should not be longer then 15 letters' do
      expect(@student).to_not be_valid
    end

    it 'should not be blank' do
      expect(:first_name).not_to be_empty
    end
  end

  describe 'student last_name' do
    before { @student.last_name = 'a' * 25 }
    it 'should not be longer then 20 letters' do
      expect(@student).to_not be_valid
    end

    it 'should not be blank' do
      expect(:last_name).not_to be_empty
    end
  end

  describe 'student age' do
    before { @student.age = 11 }
    it 'should not be greater than 10' do
      expect(@student).to_not be_valid
    end

    before { @student.age = 1 }
    it 'should not be less than 2' do
      expect(@student).to_not be_valid
    end
  end
end
