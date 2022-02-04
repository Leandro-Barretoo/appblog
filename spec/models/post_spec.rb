require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'validates posts' do
    subject do
      user = User.new(name: 'Leo', photo: 'https://someimage.jpeg', bio: 'I am a tester', postCounter: 0)
      user.posts.new(title: 'test', text: 'This is a test for rspec', commentsCounter: 1, likesCounter: 2)
    end

    before { subject.save }

    it 'title should be present' do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it 'title should not exceed 250 length' do
      subject.title = 'hello' * 250
      expect(subject).to_not be_valid
    end

    it 'comments count is integer' do
      subject.commentsCounter = 'no'
      expect(subject).to_not be_valid
    end

    it 'comments count is equal or higher than 0' do
      subject.commentsCounter = -1
      expect(subject).to_not be_valid
    end

    it 'likes count is equal or higher than 0' do
      subject.likesCounter = -1
      expect(subject).to_not be_valid
    end
  end
end
