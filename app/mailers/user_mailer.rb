class UserMailer < ApplicationMailer
	default from:"othelo.project@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.token.subject
  #
  def token(user)
    @user = user
    mail to: @user.email, subject: "Token Confirmation"
  end
end
