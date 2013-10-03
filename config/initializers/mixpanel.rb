if ["production", "staging", "development"].include?(Rails.env)
  MIXPANEL_TOKEN = Rails.env.development? ? 'a7aaa377f076a281b89bf07e6663d98f' : '89a554d405eac934d7db514656c3a3ba'
  Profiles::Application.config.middleware.use "Mixpanel::Tracker::Middleware", MIXPANEL_TOKEN
else
  class DummyMixpanel
    def people
      self
    end

    def method_missing(m, *args, &block)
      true
    end
  end
end

unless defined?(MIXPANEL_EVENT)
  file_name = "#{Rails.root}/config/mixpanel.yml"
  MIXPANEL_EVENT = YAML.load_file(file_name) if File.exists?(file_name)
end
