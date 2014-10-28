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

    @rant = "Sometimes I order a beet salad, so when the waiter comes and
                            lays down my salad I can say 'thanks for laying down those
                            funky beets'. It's an expensive joke because I don't even like beets."
  end

  scenario "Logged-in user can post a rant" do
    expect(page).to have_content("A rant about Rant")
    fill_in "A rant about", with: "first rant"
    fill_in "Rant", with: @rant
    click_on "RANT"
    expect(page).to have_content(@rant)
  end

  scenario "user sees rant validation error messages when rant post fails" do
    click_on "RANT"
    expect(page).to have_content("Title can't be blank")
    expect(page).to have_content("Rant can't be blank")
  end

  scenario "title and rant length" do
    fill_in "A rant about", with: "f"*51
    fill_in "Rant", with: "This is the first rant!"
    click_on "RANT"
    expect(page).to have_content("Title is too long (maximum is 50 characters)")
    expect(page).to have_content(" Rant is too short (minimum is 140 characters)")
  end

  scenario "user can delete their own rants" do
    fill_in "A rant about", with: "first rant"
    fill_in "Rant", with: @rant
    click_on "RANT"
    click_on "DELETE"
    expect(page).to_not have_content(@rant)
  end

  scenario "user can see other user's rants under Latest Rants section" do
    fill_in "A rant about", with: "first rant"
    fill_in "Rant", with: @rant
    click_on "RANT"
    expect(page).to have_content(@rant)
    click_on  "LOGOUT"
    expect(page).to have_content("Rantly Let it all out")
    click_on "JOIN"
    fill_in "Username", with: "user2"
    fill_in "Password", with: "password"
    fill_in "First name", with: "sample2"
    fill_in "Last name", with: "user2"
    fill_in "Bio", with: "sample bio2"
    choose('Daily')
    click_on "REGISTER"
    click_on "Login"
    fill_in "Username", with: "user2"
    fill_in "Password", with: "password"
    click_on "LOGIN"
    expect(page).to have_content("sample2 user2")
    expect(page).to have_content(@rant)
  end

end