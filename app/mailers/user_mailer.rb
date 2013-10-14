class UserMailer < ActionMailer::Base
  layout: 'mailer'
  default from: 'hello@uplaypro.com'

  def welcome_email(user)
    @user = present user
  end
end
