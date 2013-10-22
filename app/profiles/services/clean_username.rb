module Services
  class CleanUsername

    def initialize(username: nil)
      @username = username
    end

    def clean
      if username
        remove_whitespaces
        to_ascii
      end
    end

    private

    attr_reader :username

    def remove_whitespaces
      username.delete!(' ')
    end

    def to_ascii
      # removes accents
      @username = username.mb_chars.normalize(:kd).gsub(/[^[:ascii:]]/n,'').to_s
    end
  end
end
