require 'rails_helper'

RSpec.describe 'User index page', type: :feature do
  before(:each) do
    User.create!(name: 'Hdez', photo: 'https://techcrunch.com/wp-content/uploads/2015/04/codecode.jpg', bio: 'Full-Stack Web Dev',
                 email: 'hdez@gmail.com', password: '1234567', confirmed_at: Time.now)
    User.create!(name: 'Doe', photo: 'https://techcrunch.com/wp-content/uploads/2015/04/codecode.jpg', bio: 'Sofware Engineer',
                 email: 'doe@gmail.com', password: '1234567', confirmed_at: Time.now)
    subject = User.first
    subject.posts.create! title: 'Lord', text: 'The lord of the ring'
    subject.posts.create! title: 'Lord', text: 'The lord of the ring'

    visit user_session_path
    fill_in 'Email', with: 'hdez@gmail.com'
    fill_in 'Password', with: '1234567'
    click_on 'Log in'
  end

  it "I can see the user's profile picture." do
    expect(page).to have_css(".image", count: 2)
  end

  it "I can see the user's username." do
    expect(page).to have_content('Hdez')
    expect(page).to have_content('Doe')
  end

  it 'I can see the number of posts the user has written.' do
    expect(page).to have_content('Number of posts: 0')
    expect(page).to have_content('Number of posts: 2')
  end

  it "When I click on a user, I am redirected to that user's show page." do
    click_link 'Doe'
    user = User.find_by_name('Doe')
    expect(current_path).to eq user_path(user)
  end
end