module UserHelpers

  def register_user(user)
    visit '/'
    click_on "JOIN"
    expect(page).to have_content("Register Username Password First name Last name")
    fill_in "Username", with: user[:username]
    fill_in "Password", with: user[:password]
    fill_in "First name", with: user[:first_name]
    fill_in "Last name", with: user[:last_name]
    fill_in "Bio", with: user[:bio]
    choose(user[:rate])
    click_on "REGISTER"
    expect(page).to have_content("Thank you for registering!")
    click_on "Login"
    fill_in "Username", with: user[:username]
    fill_in "Password", with: user[:password]
    click_on "LOGIN"
  end

end

