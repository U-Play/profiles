class UserMailer < ActionMailer::Base
  #layout 'mailer'
  default from: 'hello@uplaypro.com'

  def welcome(user)
    @user = Presenters::UserPresenter.new(user, view_context)
    mail to: @user.email, subject: t('mailers.welcome.title', name: @user.full_name)
  end

end
