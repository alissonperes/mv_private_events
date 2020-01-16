require 'rails_helper'
require 'spec_helper'

RSpec.feature 'EventsManagements', type: :feature do
  before :each do
    @user = User.create(name: 'creator', email: 'test@test.com', password: 'foobar', password_confirmation: 'foobar')
  end

  it 'User signup and event creation' do
    visit '/signup'
    fill_in 'user_name', with: 'test'
    fill_in 'user_email', with: 'test2@test.com'
    fill_in 'user_password', with: 'foobar'
    fill_in 'user_password_confirmation', with: 'foobar'
    click_button 'Sign Up'
    expect(page).to have_content 'Welcome to the Sample App!'
    visit root_path
    expect(page).to have_content 'User Profile'
    click_link 'New event'
    expect(page).to have_field 'Description'
    fill_in 'event_description', with: 'some weird convention'
    click_button 'Create Event'
    expect(page).to have_content 'Event Created!'
  end

  it 'Login user' do
    visit '/login'
    fill_in 'session_email', with: @user.email
    click_button 'Log in'
    visit root_path
    expect(page).to have_content 'User Profile'
    click_link 'New event'
    expect(page).to have_field 'Description'
    fill_in 'event_description', with: 'some weird convention'
    click_button 'Create Event'
    expect(page).to have_content 'Event Created!'
  end

  it 'Not Logged in user' do
    visit '/login'
    fill_in 'session_email', with: 'tdfdd@dfdf.com'
    click_button 'Log in'
    expect(page).to have_content 'Invalid username. Please try again.'
  end
end
