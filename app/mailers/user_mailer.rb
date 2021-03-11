class UserMailer < ApplicationMailer
  default from: 'kaluvasriram@gmail.com'

  def welcome_email
    @user = params[:user]
    @url  = 'https://instaclone-sriram.herokuapp.com/signin'
    mail(to: @user.email, subject: 'Welcome to Instaclone')
  end
  # def welcome_email(user)
  #   @user = user
  #   @url  = 'https://instaclone-sriram.herokuapp.com/signin'
  #   mail(:to=> user.email, :subject=> "Welcome to Instaclone")
  # end
end
