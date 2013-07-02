  module Services
  class OauthAuthenticator

    def initialize(auth_data)
      set_info(auth_data)
    end

    def authenticate!
      find_by_authorization
      find_by_email unless user
      create unless user
      return user
    end

    attr_reader :user

    private

    attr_reader :info, :authorization

    def find_by_authorization
      @authorization = Authorization.where(info.slice(:provider, :uid)).first
      @user = authorization.user if authorization
    end

    def find_by_email
      @user = User.find_by_email(info[:email])
      user.authorizations.create(info) if user
    end

    def create
      @user = User.create(info.slice(:first_name, :last_name, :email).merge({password: generate_password}))
      user.authorizations.create(info)
    end

    def set_info(data)
      @info = case data.provider
        when /facebook/i then info_for_facebook(data)
      end
    end

    def info_for_facebook(data)
      {
        provider:   data.provider,
        uid:        data.uid,
        token:      data.credentials.token,
        first_name: data.extra.raw_info.first_name,
        last_name:  data.extra.raw_info.last_name,
        link:       data.extra.raw_info.link,
        image_url:  data.info.image,
        email:      data.info.email
      }
    end

    def generate_password
      Devise.friendly_token[0,20]
    end

  end
end
