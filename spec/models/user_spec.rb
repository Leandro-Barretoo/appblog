require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validate user' do
    subject do
      User.new(name: 'Leo', photo: 'https://someimag.jpeg', bio: 'I am a tester', email: 'leandro@gmail.com',
               password: '123456')
    end
    before { subject.save }

    it 'name should exist' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'posts count should be integer' do
      subject.postCounter = 3
      expect(subject).to be_valid
    end

    it 'posts count is integer' do
      subject.postCounter = 'num'
      expect(subject).to_not be_valid
    end

    it 'posts count is equal or higher than 0' do
      subject.postCounter = -3
      expect(subject).to_not be_valid
    end

    it 'is a valid user if correct parameters' do
      expect(subject).to be_valid
    end
  end
end
