Profiles::Application.configure do

  # action_mailer
  mailer_options = { host: ENV['PROFILES_ACTION_MAILER_URL'] }
  mailer_options[:port] = ENV['PROFILES_ACTION_MAILER_PORT'] if ENV['PROFILES_ACTION_MAILER_PORT']
  config.action_mailer.default_url_options = mailer_options
end
