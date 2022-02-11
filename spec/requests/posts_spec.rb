require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'posts index action' do
    before(:each) do
      @user = User.create! name: 'Doe', email: 'doe@gmail.com', password: '1233456', confirmed_at: Time.now
      sign_in(@user)
      get user_posts_path(@user)
    end

    it 'return a successful response' do
      expect(response).to have_http_status(200)
    end

    it 'renders te correct template' do
      expect(response).to render_template(:index)
    end
  end

  describe 'posts show action' do
    before(:each) do
      @user = User.create! name: 'Doe', email: 'doe@gmail.com', password: '1233456', confirmed_at: Time.now
      @post = @user.posts.create! title: 'Loren1', text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit'
      sign_in(@user)
      get user_post_path(@user, @post)
    end

    it 'return a successful response' do
      expect(response).to have_http_status(200)
    end

    it 'renders te correct template' do
      expect(response).to render_template(:show)
    end
  end
end
