module Services
  class GenerateUsername
    def initialize(user: nil)
      @user = user
      @username = ''
    end

    def generate
      set_username
      clean_username
      username
    end

    private

    attr_reader :user, :username

    def set_username
      @username = "#{user.try(:first_name)}#{user.try(:last_name)}"
    end

    def clean_username
      @username = CleanUsername.new(username: username).clean
    end
  end
end
