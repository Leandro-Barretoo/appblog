require 'rails_helper'

RSpec.describe 'User show page', type: :feature do
  before(:each) do
    @user = User.create!(name: 'Doe',
                         photo: 'https://techcrunch.com/wp-content/uploads/2015/04/codecode.jpg',
                         bio: 'Full-Stack Web Dev',
                         email: 'doe@gmail.com', password: '1234567', confirmed_at: Time.now)
    user = User.last
    user.posts.create! title: 'Loren1', text: 'Lorem Ipsum ament'
    user.posts.create! title: 'Loren2', text: 'Lorem Ipsum ament'
    user.posts.create! title: 'Loren3', text: 'Lorem Ipsum ament'
    user.posts.create! title: 'Loren4', text: 'Lorem Ipsum ament'
    visit user_session_path
    fill_in 'Email', with: 'doe@gmail.com'
    fill_in 'Password', with: '1234567'
    click_on 'Log in'
    click_on 'Doe'
  end

  it "I can see the user's profile picture." do
    expect(page).to have_css('.img', count: 1)
  end

  it "I can see the user's username." do
    expect(page).to have_content('Doe')
  end

  it 'I can see the number of posts the user has written.' do
    number = User.find_by_name('Doe').postCounter
    expect(page).to have_content("Number of posts: #{number}")
  end

  it "I can see the user's bio." do
    expect(page).to have_content('Bio')
    expect(page).to have_content('Full-Stack Web Dev')
  end

  it "I can see the user's first 3 posts." do
    expect(page).to have_content('Loren4')
    expect(page).to have_content('Loren3')
    expect(page).to have_content('Loren2')
    expect(page).to have_no_content('Loren1')
  end

  it "I can see a button that lets me view all of a user's posts." do
    expect(page).to have_link('See all posts')
  end

  it "When I click a user's post, it redirects me to that post's show page." do
    expect(page).to have_content('Loren4')
    click_on 'Loren4'
    post = Post.find_by_title('Loren4')
    expect(current_path).to eq user_post_path(@user, post)
  end

  it "When I click to see all posts, it redirects me to the user's post's index page." do
    click_link 'See all posts'
    expect(current_path).to eq user_posts_path(@user)
  end
end
