require 'rails_helper'

RSpec.describe 'Login page', type: :feature do
  before(:each) do
    visit user_session_path
    User.create! name: 'Leo', password: '123456', email: 'leandro@gmail.com', confirmed_at: Time.now
  end

  it 'I can see the username and password inputs and the "Submit" button' do
    expect(page).to have_field(type: 'email')
    expect(page).to have_field(type: 'password')
    expect(page).to have_button(type: 'submit')
  end

  it 'When I click the submit button without filling in
  the username and the password, I get a detailed error' do
    click_on 'Log in'
    expect(page).to have_content('Invalid Email or password.')
  end

  it 'When I click the submit button after filling in the username
  and the password with incorrect data, I get a detailed error' do
    fill_in 'Email', with: 'leo@gmail.com'
    fill_in 'Password', with: '1'
    click_on 'Log in'
    expect(page).to have_content('Invalid Email or password')
  end

  it 'When I click the submit button after filling in the username
  and the password with correct data, I am redirected to the root path' do
    fill_in 'Email', with: 'leandro@gmail.com'
    fill_in 'Password', with: '123456'
    click_on 'Log in'
    expect(current_path).to eq root_path
  end
end
