require 'rails_helper'
require 'capybara/rails'

feature "dashboard" do

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

    fill_in "A rant about", with: "first rant"
    fill_in "Rant", with: @rant
    click_on "RANT"
    click_on "LOGOUT"

    click_on "JOIN"
    expect(page).to have_content("Register Username Password First name Last name")
    fill_in "Username", with: "user2"
    fill_in "Password", with: "password"
    fill_in "First name", with: "sample2"
    fill_in "Last name", with: "user2"
    fill_in "Bio", with: "sample bio2"
    choose('Weekly')
    click_on "REGISTER"
    click_on "Login"
    fill_in "Username", with: "user2"
    fill_in "Password", with: "password"
    click_on "LOGIN"
  end

  scenario "user's name is a link to user's profile in rant view" do
    click_on "sample user"
    expect(page).to have_content("sample user Weekly Ranter sample bio")
  end

  scenario "can see user's rants on profile view" do
    click_on "sample user"
    expect(page).to have_content("first rant sample user Sometimes I order a beet salad, so when the waiter comes and
                            lays down my salad I can say 'thanks for laying down those
                            funky beets'. It's an expensive joke because I don't even like beets.")
  end

  scenario "rant views are linked to rant body on dash view" do
    click_on "Sometimes I order a beet salad"
    expect(page).to have_content("first rant 0 Favorites By Sample User Sometimes I order a beet salad, so when the waiter comes and")
    expect(page).to have_content("Comments")
  end

end