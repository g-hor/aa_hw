class UserMailer < ApplicationMailer

  def welcome_email(user)
    @user = user
    @url = 'http://localhost:3000/users/new'
    mail(to: user.username, subject: 'Thanks for signing up!')
  end
end
