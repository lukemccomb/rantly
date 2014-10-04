require 'rails_helper'
require 'capybara/rails'

feature "index page" do
  before :each do
    visit '/'
    click_on "JOIN"
    expect(page).to have_content("Register Username Password First name Last name")
    fill_in "Username", with: "user"
    fill_in "Password", with: "password"
    fill_in "First name", with: "sample"
    fill_in "Last name", with: "user"
    fill_in "Bio", with: "sample bio"
    choose('Weekly')
    click_on "REGISTER"
    click_on "Login"
    fill_in "Username", with: "user"
    fill_in "Password", with: "password"
    click_on "LOGIN"
  end

  scenario "Loggedin user sees place post a rant" do
    expect(page).to have_content("A rant about Rant")
  end




end