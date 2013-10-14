module Services
  class CreateUser
    
    def initialize(info, token)
      @info = info
      @token = token
    end

    def create
      @user = User.create(user_info)
      @user.authorizations.create(auth_info)
      increment_referral
      send_welcome_email
      @user
    end

    private

    attr_accessor :info, :token

    def user_info
      info
        .slice(:first_name, :last_name, :email, :birth_date, :gender)
        .merge(facebook_link: info[:link], password: generate_password)
    end

    def auth_info
      info
    end

    def increment_referral
      if @token
        User.where(token: token).first.increment!(:referral_subscriptions)
      end
    end

    def send_welcome_email
      UserMailer.welcome_email(user).deliver
    end

    def generate_password
      Devise.friendly_token[0,20]
    end

  end
end
