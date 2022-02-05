require 'rails_helper'

RSpec.describe 'Users', type: :request do
  before(:all) do
    Rails.application.load_seed
  end

  describe 'users index action' do
    before { get '/users' }

    it 'return a successful response for users#index' do
      expect(response).to have_http_status(200)
    end

    it 'renders te correct template' do
      expect(response).to render_template(:index)
    end
  end

  describe 'users show action' do
    before(:example) { get user_path(User.first.id) }
    it 'return a successful response for users#show' do
      expect(response).to have_http_status(200)
    end

    it 'renders te correct template' do
      expect(response).to render_template(:show)
    end
  end
end
