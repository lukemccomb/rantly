require 'rails_helper'
require 'capybara/rails'

feature "favorite" do

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

  scenario "user can favorite a rant on its show view" do
    click_on "Sometimes I order"
    click_on "Favorite"
    expect(page).to have_content("1 Favorite")
    click_on "Favorites"
    expect(page).to have_content("Sometimes I order a beet salad, so when the waiter comes and
                            lays down my salad I can say 'thanks for laying down those
                            funky beets'.")
  end

  scenario "user can favorite/unfavorite a rant on dash" do
    click_on "Favorite"
    click_on "Favorites"
    expect(page).to have_content("Sometimes I order a beet salad, so when the waiter comes and
                            lays down my salad I can say 'thanks for laying down those
                            funky beets'.")
    click_on "Dashboard"
    click_on "Unfavorite"
    click_on "Favorites"
    expect(page).to have_no_content("Sometimes I order a beet salad, so when the waiter comes and")
  end

  scenario "user can comment on a rant" do
    click_on "Sometimes I order"
    fill_in "comment_comment", with: "This is the rantiest of rants!"
    click_on "RANT BACK"
    expect(page).to have_content("This is the rantiest of rants!")
  end


end
