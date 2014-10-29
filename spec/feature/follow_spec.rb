require 'rails_helper'
require 'capybara/rails'

feature "dashboard" do

  before :each do
    user = {username: 'username',
            password: 'password',
            first_name: 'sample',
            last_name: 'user',
            bio: 'sample bio',
            rate: 'Weekly'}
    register_user(user)

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

  scenario "user can follow others and see followed on following page" do
    click_on "Follow"
    click_on "Following"
    expect(page).to have_content("sample")
  end
end