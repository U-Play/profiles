if ["production", "staging", "development"].include?(Rails.env)
  if defined?(ACCOUNTS)
    MIXPANEL_TOKEN = ACCOUNTS['mixpanel'][Rails.env]
  end
else
  class DummyMixpanel
    def method_missing(m, *args, &block)
      self
    end
  end
end

unless defined?(MIXPANEL_EVENT)
  file_name = "#{Rails.root}/config/mixpanel.yml"
  MIXPANEL_EVENT = YAML.load_file(file_name) if File.exists?(file_name)
end
