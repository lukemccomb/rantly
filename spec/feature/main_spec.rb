require 'rails_helper'
require 'capybara/rails'

feature "index page" do
  before :each do
    visit '/'
  end

  scenario "anonymous can visit the homepage and see sample quote" do
    expect(page).to have_content("Rantly Let it all out")
  end

  scenario "anonymous can register" do
    click_on "JOIN"
    expect(page).to have_content("Register Username Password First name Last name")
  end

end