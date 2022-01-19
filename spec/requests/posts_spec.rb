require 'rails_helper'

RSpec.describe "Posts", type: :request do
  describe 'posts index action' do
    before(:example) { get user_posts }

    it 'return a successful response' do
      expect(response).to have_http_status(200)
    end

    it 'renders te correct template' do
      get user_posts
      expect(response).to render_template(:index)
    end

    it 'includes placeholder text' do
      get user_posts
      expect(response.body).to include('Here is a list of posts for a given user')
    end
  end

  describe 'posts show action' do
    it 'return a successful response' do
      get user_post
      expect(response).to have_http_status(200)
    end

    it 'renders te correct template' do
      get user_post
      expect(response).to render_template(:show)
    end

    it 'includes placeholder text' do
      get user_post
      expect(response.body).to include('Here is the information of a single post id')
    end
  end
end
