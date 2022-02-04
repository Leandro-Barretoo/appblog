require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'posts index action' do
    before(:example) { get user_posts_path(user_id: User.first.id) }

    it 'return a successful response' do
      expect(response).to have_http_status(200)
    end

    it 'renders te correct template' do
      expect(response).to render_template(:index)
    end
  end

  describe 'posts show action' do
    before(:example) do
      @post = Post.new(author_id: User.first.id, title: 'Hello', text: 'Hello world!', commentsCounter: 0,
                       likesCounter: 0)
      @post.save
    end
    before(:example) { get user_post_path(User.first.id, id: Post.first.id) }

    it 'return a successful response' do
      expect(response).to have_http_status(200)
    end

    it 'renders te correct template' do
      expect(response).to render_template(:show)
    end
  end
end
