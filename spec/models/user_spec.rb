require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Create User' do
    before(:each) do
      @user = User.create(name: 'Burak', email: 'burak@gmail.com', password: 'abcdef')
    end

    it 'Should be valid' do
      expect(@user).to be_valid
    end

    it 'Should not be valid if name is not provided' do
      @user.name = nil
      expect(@user).to_not be_valid
    end

    it 'Should not be valid if email is not provided' do
      @user.email = nil
      expect(@user).to_not be_valid
    end

    it 'Should validate password' do
      expect(@user.valid_password?('abcdef')).to eql true
      expect(@user.valid_password?('abcdefjdn')).to eql false
    end
  end
end