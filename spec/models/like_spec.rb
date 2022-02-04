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
end
