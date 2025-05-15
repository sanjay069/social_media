class UserMailer < ApplicationMailer
  default from: "sk1883517@gmail.com"

  def welcome_email
    @email = Friend.find_by(params[:params]).email
    mail(to: @email, subject: "like")
  end

  def dislike
    @email = Friend.find_by(params[:params]).email
    mail(to: @email, subject: "dislike")
  end  
end