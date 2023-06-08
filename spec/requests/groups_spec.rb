require 'rails_helper'

RSpec.describe 'Groups', type: :request do
  include Devise::Test::IntegrationHelpers

  describe 'GET /groups' do
    before(:each) do
      @user = User.create(id: 1, name: 'Burak', email: 'bb@gmail.com', password: 'abcdef')
      @user.save
      sign_in @user
      @group = Group.create(name: 'GoodMorning', icon: 'https://qql.net', user_id: @user.id)
    end

    it 'Should return http success' do
      get groups_path
      expect(response).to have_http_status(:success)
    end

    it 'should render categories/index template' do
      get groups_path
      expect(response).to render_template(:index)
    end

    it 'should render categories/new template' do
      get new_group_path
      expect(response).to render_template(:new)
    end
  end
end