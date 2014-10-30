require 'rails_helper'
require 'capybara/rails'

feature "follow" do

  before :each do
    user = {username: 'username',
            password: 'password',
            first_name: 'sample',
            last_name: 'user',
            bio: 'sample bio',
            rate: 'Weekly'}
    register_user(user)

    user2 = {}


    user.map { |key, value| user2[key] = value + "2" }
    user2[:rate] = "Weekly"

    @rant = "Sometimes I order a beet salad, so when the waiter comes and
                            lays down my salad I can say 'thanks for laying down those
                            funky beets'. It's an expensive joke because I don't even like beets."

    fill_in "A rant about", with: "first rant"
    fill_in "Rant", with: @rant
    click_on "RANT"
    click_on "LOGOUT"

    register_user(user2)

  end

  scenario "user can follow others and see followed on following page" do
    click_on "sample user"
    click_on "Follow"
    click_on "Following"
    expect(page).to have_content("sample")
  end

  scenario "user can follow other users from the dashboard" do
    click_on "Follow"
    click_on "Following"
    expect(page).to have_content("sample")
  end

  scenario "user can unfollow a followed user" do
    click_on "sample user"
    click_on "Follow"
    click_on "Unfollow"
    click_on "Following"
    within(".rant-feed") do
      expect(page).to have_no_content("sample")
    end
  end

  scenario "user can unfollow a followed user from dash" do
    click_on "Follow"
    click_on "Unfollow"
    click_on "Following"
    within(".rant-feed") do
      expect(page).to have_no_content("sample")
    end
  end

  scenario "user can unfollow a followed user from Following view" do
    click_on "sample user"
    click_on "Follow"
    click_on "Following"
    click_on "Unfollow"
    within(".rant-feed") do
      expect(page).to have_no_content("sample")
    end
  end

end