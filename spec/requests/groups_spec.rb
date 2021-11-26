require 'rails_helper'

RSpec.describe 'Groups', type: :request do
  include Devise::Test::IntegrationHelpers
  let(:user) { User.create(username: 'Des', email: 'Des@mail.com', password: '123456') }
  describe 'GET /new' do
    before do
      sign_in user
      get new_group_path
    end
    it 'should have response status correct(ok)' do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'new' template" do
      expect(response).to render_template('new')
    end
  end

  describe 'GET /index' do
    before do
      sign_in user
      get groups_path
    end
    it 'should have response status correct(ok)' do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'index' template" do
      expect(response).to render_template('/')
    end
  end

  describe 'GET /show' do
    let(:group) { Group.create(name: 'Fast Food', icon: 'http//', user: user) }

    before do
      sign_in user
      get groups_path(group.id)
    end
    it 'should have response status correct(ok)' do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'show' template" do
      expect(response).to render_template('index')
    end
  end
end
