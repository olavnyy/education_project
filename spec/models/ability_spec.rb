require 'rails_helper'
require 'cancan/matchers'

RSpec.describe User, type: :model do
  describe 'Ability' do
    describe 'as Superadmin' do
      before do
        @superadmin = User.new(type: 'Superadmin')
        @ability = Ability.new(@superadmin)
      end
      it 'can manage all' do
        expect(@ability).to be_able_to(:manage, :all)
      end
    end

    describe 'as Admin' do
      before(:all) do
        @admin = User.new(type: 'Admin', school_id: '1')
        @ability = Ability.new(@admin)
        @school = School.new(id: @admin.school_id)
        @group = Group.new(school_id: @admin.school_id)
        @level = Level.new(school_id: @admin.school_id)
        @student = Student.new(school_id: @admin.school_id)
        @teacher = Teacher.new(school_id: @admin.school_id)
        @parent = Parent.new(school_id: @admin.school_id)
      end

      it 'can read School which has him' do
        expect(@ability).to be_able_to(:read, @school)
      end

      it 'can crud Group which belongs to him' do
        expect(@ability).to be_able_to(:crud, @group)
      end

      it 'can crud Level which belongs to him' do
        expect(@ability).to be_able_to(:crud, @level)
      end

      it 'can crud Student which belongs to him' do
        expect(@ability).to be_able_to(:crud, @student)
      end

      it 'can crud Teacher which belongs to him' do
        expect(@ability).to be_able_to(:crud, @teacher)
      end

      it 'can crud Parent which belongs to him' do
        expect(@ability).to be_able_to(:crud, @parent)
      end
    end

    describe 'as Teacher' do
      before(:all) do
        @teacher = User.new(type: 'Teacher', school_id: '1', group_id: '2')
        @ability = Ability.new(@teacher)
        @school = School.new(id: @teacher.school_id)
        @group = Group.new(id: @teacher.group_id, level_id: '3')
        @student = Student.new(group_id: @teacher.group_id)
      end

      it 'can read School which has him' do
        expect(@ability).to be_able_to(:read, @school)
      end

      it 'can read Group which belongs to him' do
        expect(@ability).to be_able_to(:read, @group)
      end

      it 'can read Student which belongs to him' do
        expect(@ability).to be_able_to(:read, @student)
      end
    end

    describe 'as Parent' do
      before(:all) do
        @parent = User.new(type: 'Parent', school_id: '1')
        @ability = Ability.new(@parent)
        @school = School.new(id: @parent.school_id)
      end

      it 'can read School which has him' do
        expect(@ability).to be_able_to(:read, @school)
      end
    end
  end
end
