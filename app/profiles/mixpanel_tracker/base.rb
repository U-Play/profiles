module MixpanelTracker
  module Base

    def tracker
      @_tracker ||= Mixpanel::Tracker.new ACCOUNTS['mixpanel']['token']
    end

  end
end
