require 'rails_helper'
require 'capybara/rails'

feature "index page" do
  before :each do
    visit '/'
  end

  scenario "anonymous can visit the homepage and see sample quote" do
    expect(page).to have_content("Rantly Let it all out")
  end

  before :each do
    click_on "JOIN"
    expect(page).to have_content("Register Username Password First name Last name")
    fill_in "Username", with: "user"
    fill_in "Password", with: "password"
    fill_in "First name", with: "sample"
    fill_in "Last name", with: "user"
    fill_in "Bio", with: "sample bio"
    choose('Weekly')
    click_on "REGISTER"
  end

  scenario "anonymous can register" do
    expect(page).to have_content("Thank you for registering! Please log in to begin ranting.")
  end

  scenario "Registered user can login" do
    click_on "Login"
    fill_in "Username", with: "user"
    fill_in "Password", with: "password"
    click_on "LOGIN"
    expect(page).to have_content("Welcome sample user")
  end

  scenario "Logged in user can log out" do
    click_on "Login"
    fill_in "Username", with: "user"
    fill_in "Password", with: "password"
    click_on "LOGIN"
    click_on "LOGOUT"
    expect(page).to have_content("Rantly Let it all out")
  end

end