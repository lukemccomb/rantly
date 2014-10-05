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

  scenario "Logged-in user can post a rant" do
    expect(page).to have_content("A rant about Rant")
    fill_in "A rant about", with: "first rant"
    fill_in "Rant", with: "This is the first rant!"
    click_on "RANT"
    expect(page).to have_content("My Rants first rant This is the first rant!")
  end

  scenario "user can delete their own rants" do
    fill_in "A rant about", with: "first rant"
    fill_in "Rant", with: "This is the first rant!"
    click_on "RANT"
    click_on "DELETE"
    expect(page).to_not have_content("My Rants first rant This is the first rant!")
  end

end