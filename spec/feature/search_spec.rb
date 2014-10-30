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

  scenario "user can search for rants by text" do
    click_on "Search"
    fill_in "search_term", with: "beets"
    click_on "SEARCH"
    expect(page).to have_content(@rant)
    fill_in "search_term", with: "first"
    click_on "SEARCH"
    expect(page).to have_content(@rant)
  end
end