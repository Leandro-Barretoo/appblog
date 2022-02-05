require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'validate likes' do
    subject { Like.new(author_id: 1, post_id: 2) }
    before { subject.save }

    it 'author_id is integer' do
      subject.author_id = 'name'
      expect(subject).to_not be_valid
    end

    it 'post_id is intege' do
      subject.post_id = 'name'
      expect(subject).to_not be_valid
    end

    it 'author_id is equal or higher than 0' do
      subject.author_id = -1
      expect(subject).to_not be_valid
    end

    it 'post_id is equal or higher than 0' do
      subject.post_id = -2
      expect(subject).to_not be_valid
    end
  end

  describe 'updates counter' do
    subject do
      user = User.new(name: 'Leo', photo: 'https://someimage.jpeg', bio: 'I am a tester', postCounter: 0)
      user.posts.new(title: 'test', text: 'This is a test for rspec', commentsCounter: 0, likesCounter: 0)
    end

    before { subject.save }

    it 'should update comments counter' do
      subject.likes.new
      subject.likes[0].like_updater(subject.likes.length)
      expect(subject.likesCounter).to eq(1)
    end
  end
end
