require 'rails_helper'

RSpec.describe 'Index Page', type: :system do
  before(:each) do
    User.create(email: 'user1@email.com', name: 'user1', password: '123456')
  end

  it 'Login Page require' do
    visit root_path
    expect(page).to have_content('Sign up')
  end

  it 'denies access to unlogged' do
    visit root_path
    expect(page).to_not have_content('Welcome to Requests')
  end

  it 'log in with name and password' do
    visit root_path
    fill_in 'Email', with: 'user1@email.com'
    fill_in 'Password', with: '123456'
    click_button 'Log in'
    expect(page).to have_content('Sign out')
  end

  it 'allows the user to sign up' do
    visit root_path
    click_link 'SIGN UP'
    fill_in 'Email', with: 'user2@email.com'
    fill_in 'Password', with: '123456'
    fill_in 'Password confirmation', with: '123456'
    click_button 'Sign up'
    expect(page).to have_content('New technical request')
  end

  it 'redirects to Index after successufully logged in.' do
    visit root_path
    fill_in 'Email', with: 'user1@email.com'
    fill_in 'Password', with: '123456'
    click_button 'Log in'
    expect(page).to have_content('Welcome to Requests')
  end

  it 'permits the logged in user to logout' do
    visit root_path
    fill_in 'Email', with: 'user1@email.com'
    fill_in 'Password', with: '123456'
    click_button 'Log in'
    click_link 'Sign out'
    expect(page).to have_content('Sign up')
  end
end
