module Services
  class UpdateTeam

    def initialize(team: nil, new_attributes: nil)
      @new_attributes = new_attributes
      @team = team
    end

    def update
      assign_sport
      assign_attributes
      save_team
      update_to_mixpanel
    end

    def succeeded?
      succeeded
    end

    def errors
      team.errors.full_messages.first
    end

    private

    attr_reader :team, :succeeded, :new_attributes

    def assign_attributes
      @team.attributes = new_attributes
    end

    def assign_sport
      @team.sport = Sport.where(name: new_attributes[:sport]).first
      new_attributes.delete(:sport)
    end

    def save_team
      @succeeded = team.save
    end

    def update_to_mixpanel
      if succeeded?
        mixpanel = Services::MixpanelTracker.new user: team.user
        mixpanel.add_team
      end
    end
  end
end
