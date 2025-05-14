class UserMailer < ApplicationMailer
  default from: "sk1883517@gmail.com"

  def welcome_email
    @email = Friend.find_by(params[:params]).email
    mail(to: @email, subject: "You got a new order!")
    # mail(to: @email,
    #      subject: "Welcome to My Awesome Site") do |format|
    #   format.html { render "another_template" }
    #   format.text { render plain: "hello" }
    #   format.json { render json: "email send"}
    # end
  end
end