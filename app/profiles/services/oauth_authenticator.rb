module Services
  class OauthAuthenticator

    def initialize(raw_data)
      @raw_data = raw_data
      set_info
    end

    def authenticate!
      find_by_authorization
      find_by_email unless user
      create unless user
      return user
    end

    attr_reader :user

    private

    attr_reader :raw_data, :info, :authorization

    def find_by_authorization
      @authorization = Authorization.where(info.slice(:provider, :uid)).first
      @user = authorization.user if authorization
    end

    def find_by_email
      @user = User.find_by_email(info[:email])
      user.authorizations.create(info) if user
    end

    def create
      user_info = info.slice(:first_name, :last_name, :email, :birth_date).merge(facebook_link: info[:link], password: generate_password)
      @user = User.create(user_info)
      user.authorizations.create(info)
    end

    def set_info
      @info = case raw_data.provider
        when /facebook/i then info_for_facebook
      end
    end

    def info_for_facebook
      {
        provider:   data_try_chain(:provider),
        uid:        data_try_chain(:uid),
        token:      data_try_chain(:credentials, :token),
        first_name: data_try_chain(:info, :first_name),
        last_name:  data_try_chain(:info, :last_name),
        link:       data_try_chain(:extra, :raw_info, :link),
        birth_date: to_date(data_try_chain(:extra, :raw_info, :birthday)),
        image_url:  data_try_chain(:info, :image),
        email:      data_try_chain(:info, :email)
      }
    end

    def to_date(date_str)
      return nil unless date_str
      DateTime.strptime(date_str, '%m/%d/%Y')
    end

    def data_try_chain(*args)
      args.inject(raw_data) { |ret, current| ret.try(current) }
    end

    def generate_password
      Devise.friendly_token[0,20]
    end

  end
end
