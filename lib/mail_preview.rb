if Rails.env.development?
  class MailPreview < MailView
  
    def welcome
      UserMailer.welcome(User.first)
    end
  end
end
