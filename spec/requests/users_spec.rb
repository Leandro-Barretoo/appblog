require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'users index action' do
    before(:example) { get '/users' }

    it 'return a successful response for users#index' do
      expect(response).to have_http_status(200)
    end

    it 'renders te correct template' do
      expect(response).to render_template(:index)
    end

    it 'includes placeholder text' do
      expect(response.body).to include('Here is a list of all users')
    end
  end

  describe 'users show action' do
    before(:example) { get '/users/1' }

    it 'return a successful response for users#show' do
      expect(response).to have_http_status(200)
    end

    it 'renders te correct template' do
      expect(response).to render_template(:show)
    end

    it 'includes placeholder text' do
      expect(response.body).to include('Here is the information of a given user id')
    end
  end
end
