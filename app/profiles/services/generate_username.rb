module Services
  class GenerateUsername

    def initialize(user)
      @user = user
    end

    def generate
      set_default_username
      remove_whitespaces
      to_ascii
      username
    end

    private

    def remove_whitespaces
      @username.delete!(' ')
    end

    def set_default_username
      @username = user.username.presence || "#{user.first_name}#{user.last_name}"
    end

    def to_ascii
      # removes accents
      @username = username.mb_chars.normalize(:kd).gsub(/[^[:ascii:]]/n,'').to_s
    end

    attr_reader :user, :username

  end
end
