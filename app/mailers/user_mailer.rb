class UserMailer < ApplicationMailer
	default from: 'othello_project@hotmail.com'
	layout 'mailer'
 
  def token_confirmation_email(user)
    @user = user
    mail(to: @user.email, subject: 'Confirmation Token')
  end

end
