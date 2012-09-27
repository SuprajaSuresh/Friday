class UserMailer < ActionMailer::Base
  default from: "reachout@example.com"

  def welcome_email(user)
    @user = user
    @url  = "http://192.168.6.35:3000"
    mail(:to => user.email, :subject => "Welcome to ReAcH OuT")
  end
end
