require 'rails_helper'

RSpec.describe 'Entities', type: :request do
  include Devise::Test::IntegrationHelpers

  describe 'GET /groups' do
    before(:each) do
      @user = User.create(id: 1, name: 'Burak', email: 'bb@gmail.com', password: 'abcdef')
      @user.save
      sign_in @user
      @group = Group.create(id:1, name: 'GoodMorning', icon: 'https://qql.net', user_id: @user.id)
      @entity = Entity.create(name: 'GoodMorning', amount: 12, author_id: @user.id, group_id: [@group.id])
    end



      it "renders the new template" do
        get new_group_entity_path(@group)
        expect(response).to render_template(:new)
      end

    it "assigns a new entity" do
      get new_group_entity_path(@group)
      expect(assigns(:entity)).to be_a_new(Entity)
    end

    it 'should display the transaction page' do
      get new_group_entity_path(@group)
      expect(response.body).to include('Create new Transections')
    end
 
  end
end