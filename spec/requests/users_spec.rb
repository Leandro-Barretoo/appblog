require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe 'users index action' do 
    it 'return a successful response for users#index' do
      get users
      expect(response).to have_http_status(200)
    end

    it 'renders te correct template' do
      get users
      expect(response).to render_template(:index)
    end

    it 'includes placeholder text' do
      get users
      expect(response.body).to include('Here is a list of all users')
    end
  end

  describe 'users show action' do
    it 'return a successful response for users#show' do
      get user
      expect(response).to have_http_status(200)
    end

    it 'renders te correct template' do
      get user
      expect(response).to render_template(:show)
    end

    it 'includes placeholder text' do
      get user
      expect(response.body).to include('Here is the information of a given user id')
    end
  end
end
