class UserMailer < ActionMailer::Base

  default from: "inyourshoeschat@gmail.com"
  
  def welcome_email(user)
    @user = user
    @url ='https://inyourshoes.herokuapp.com/signup'
    mail(to: @user.email, subject: 'Welcome to InYourShoes!')
  end
end
