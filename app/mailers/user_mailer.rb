class UserMailer < ActionMailer::Base
  default from: "mrrantr@gmail.com"

  def welcome_email(user)
    @user = user
    @url = "http://luke-rantly.herokuapp.com/session/new"
    mail(to: @user.email, subject: "Welcome to Rantly!")
  end

  def rant_notifier(follower, url, user)
    if follower.email
      @user = user
      @url = url
      mail(to: follower.email, subject: "#{@user.username} went on a Rant")
    end
  end


end
