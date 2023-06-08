require 'rails_helper'

RSpec.describe Entity, type: :model do
  describe 'Create Entity' do
    before(:each) do
      @user = User.create(id: 1, name: 'Burak', email: 'burak@gmail.com', password: 'abcdef')
      @entity = Entity.create(name: 'Burak', amount: 1, author_id: @user.id)
    end

    it 'Should be valid' do
      expect(@entity).to be_valid
    end

    it 'Should not be valid if name is not provided' do
      @entity.name = nil
      expect(@entity).to_not be_valid
    end

    it 'Should not be valid if icon url is not provided' do
      @entity.amount = nil
      expect(@entity).to_not be_valid
    end
  end
end
