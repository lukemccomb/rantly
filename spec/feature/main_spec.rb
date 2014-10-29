require 'rails_helper'
require 'capybara/rails'

feature "index page" do

  before :each do
    user = {username: 'username',
            password: 'password',
            first_name: 'sample',
            last_name: 'user',
            bio: 'sample bio',
            rate: 'Weekly'}
    register_user(user)
  end

  scenario "anonymous sees registration errors when registration fails" do
    click_on "LOGOUT"
    click_on "JOIN"
    click_on "REGISTER"
    expect(page).to have_content("Username Username can't be blank")
    expect(page).to have_content("Password Password can't be blank")
    expect(page).to have_content("First name First name can't be blank")
    expect(page).to have_content("Last name Last name can't be blank")
    expect(page).to have_content("Bio Bio can't be blank")
    expect(page).to have_content("How often do you rant? Rate can't be blank")
    fill_in "Username", with: "username"
    fill_in "Password", with: "pass"
    click_on "REGISTER"
    expect(page).to have_content("Username has already been taken")
    expect(page).to have_content("Password is too short (minimum is 8 characters)")
  end

  scenario "user sees error message when login fails" do
    click_on "LOGOUT"
    click_on "Login"
    click_on "LOGIN"
    expect(page).to have_content("Username / password is invalid")
  end

  scenario "Logged in user can log out" do
    click_on "LOGOUT"
    expect(page).to have_content("Rantly Let it all out")
  end

  scenario "user can edit their profile" do
    click_on "LOGOUT"
    click_on "Login"
    fill_in "Username", with: "username"
    fill_in "Password", with: "password"
    click_on "LOGIN"
    click_on "sample user"
    expect(page).to have_content("Edit Profile")
    fill_in "First name", with: "Sample"
    click_on "UPDATE"
    expect(page).to have_content("Sample user")
  end

end