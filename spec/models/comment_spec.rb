require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'validates comments' do
    subject { Comment.new(text: 'Comment text', author_id: 1, post_id: 2) }

    before { subject.save }

    it 'author_id should be integer' do
      subject.author_id = 'id'
      expect(subject).to_not be_valid
    end

    it 'post_id should be integer' do
      subject.post_id = 'one'
      expect(subject).to_not be_valid
    end

    it 'text should be present' do
      subject.text = nil
      expect(subject).to_not be_valid
    end

    it 'author id should be greater or equal to 0 and integer' do
      subject.author_id = -2
      expect(subject).to_not be_valid
    end

    it 'post id should be greater or equal to 0 and integer' do
      subject.post_id = -1
      expect(subject).to_not be_valid
    end
  end
end
