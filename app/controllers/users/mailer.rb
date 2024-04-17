class Users::Mailer < Devise::Mailer
  def welcome_email
    @user = user
    mail(to: @user.email)
  end
end
