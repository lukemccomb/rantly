require 'spec_helper'

feature "index page" do

  scenario "anonymous can visit the homepage and see sample quote" do
    visit '/'
    expect(page).to have_content("Rantly Let it all out")
  end

end