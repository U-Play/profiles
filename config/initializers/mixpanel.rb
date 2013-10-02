unless defined?(MIXPANEL_EVENT)
  file_name = "#{Rails.root}/config/mixpanel.yml"

  MIXPANEL_EVENT = YAML.load_file(file_name) if File.exists?(file_name)
end
