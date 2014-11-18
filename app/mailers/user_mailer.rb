class UserMailer < ActionMailer::Base
  default from: "mrrantr@gmail.com"

  def welcome_email(user)
    @user = user
    @url = "http://luke-rantly.herokuapp.com/session/new"
    mail(to: @user.email, subject: "Welcome to Rantly!")
  end


end
