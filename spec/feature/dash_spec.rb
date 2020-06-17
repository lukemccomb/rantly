require 'rails_helper'
require 'capybara/rails'

feature "dashboard" do

  before :each do
    user = {username: 'username',
            password: 'password',
            email: 'user@mail.com',
            first_name: 'sample',
            last_name: 'user',
            bio: 'sample bio',
            rate: 'Weekly'}
    register_user(user)

    # user2 = {}
    #
    # user.map { |key, value| user2[key] = value + "2" }
    # user2[:rate] = "Weekly"
    #
    # @rant = "Sometimes I order a beet salad, so when the waiter comes and
    #                         lays down my salad I can say 'thanks for laying down those
    #                         funky beets'. It's an expensive joke because I don't even like beets."
    #
    # fill_in "A rant about", with: "first rant"
    # fill_in "Rant", with: @rant
    # click_on "RANT"
    # click_on "LOGOUT"
    # register_user(user2)

  end

  # need to confirm users account using

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

  scenario "user's name is linked to user profile in rant show" do
    click_on "Sometimes I order a beet salad"
    click_on "Sample User"
    expect(page).to have_content("sample user Weekly Ranter sample bio")
  end

end
