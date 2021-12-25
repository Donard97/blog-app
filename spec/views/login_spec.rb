require 'rails_helper'
# rubocop:disable Metrics/BlockLength
RSpec.feature 'Login', type: :feature do
  it 'can enter a name and receive a greeting' do
    visit user_session_path
    expect(page).to have_content 'Log in'
  end

  it 'user can see inputs and button' do
    visit user_session_path
    expect(page).to have_current_path(user_session_path)
  end

  it 'click the login error' do
    visit user_session_path
    click_button 'Log in'
    expect(page).to have_content 'Invalid Email or password.'
  end

  it 'click the login error' do
    User.create(name: 'Testing', posts_counter: 0, email: 'user@example.com', password: 'password')
    visit user_session_path
    fill_in 'user[email]', with: 'user.email'
    fill_in 'user[password]', with: 'password'
    click_button 'Log in'
    expect(page).to have_content 'Forgot your password?'
  end

  it 'Login successfully' do
    User.create(name: 'Testing', posts_counter: 0, email: 'user@example.com', password: 'password')
    visit user_session_path
    fill_in 'user[email]', with: 'user.email'
    fill_in 'user[password]', with: 'password'
    click_button 'Log in'
    expect(page).to have_current_path(user_session_path)
  end

  it 'click the login error' do
    User.create(name: 'Testing', posts_counter: 0, email: 'user@example.com', password: 'password')
    visit user_session_path
    fill_in 'user[email]', with: 'user.email'
    click_button 'Log in'
    expect(page).to have_content 'Invalid Email or password.'
  end
end
# rubocop:enable Metrics/BlockLength
