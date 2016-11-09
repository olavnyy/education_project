require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = User.new(email: 'test@test.test', password: 'password', password_confirmation: 'password', first_name: 'Firstname', last_name: 'Lastname', contact_phone: '+380 (50) 111 00 00')
  end

  subject { @user }
  it { is_expected.to respond_to(:email) }
  it { is_expected.to respond_to(:encrypted_password) }
  it { is_expected.to respond_to(:password) }
  it { is_expected.to respond_to(:password_confirmation) }
  it { is_expected.to respond_to(:first_name) }
  it { is_expected.to respond_to(:last_name) }
  it { is_expected.to respond_to(:contact_phone) }

  it { should be_valid }

  describe 'when email is not present' do
    it'empty email not valid' do
      @user.email = ' '
      expect(@user).to_not be_valid
    end
  end

  describe 'when email form in valid' do
    it 'is be valid' do
      addresses = %w(user@foo.COM A_US-ER@f.org frst.lst@foo.jp a+b@baz.cn)
      addresses.each do |adress_valid|
        @user.email = adress_valid
        expect(@user).to be_valid
      end
    end
  end

  describe 'when emaiil form in invalid' do
    it 'eamil is invalid' do
      addresses = %w(user@foo,com user_at_foo.org example.user@foo. foo@bar_baz.com foo@bar+baz.com)
      addresses.each do |adress_invalid|
        @user.email = adress_invalid
        expect(@user).not_to be_valid
      end
    end
  end

  # Password validation and confirmation
  describe 'when password is not present' do
    it 'empty password is invalid' do
      @user.password = @user.password_confirmation = '   '
      expect(@user).to_not be_valid
    end
  end

  describe 'when confirmation false' do
    it 'confirmation invalid' do
      @user.password_confirmation = 'abacac'
      expect(@user).to_not be_valid
    end
  end

  describe 'when password is too short' do
    it 'too shoort password invalid' do
      @user.password = @user.password_confirmation = 'a' * 5
      expect(@user).to_not be_valid
    end
  end


end
