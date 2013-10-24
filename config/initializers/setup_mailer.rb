if Rails.env.production? || Rails.env.staging?
  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.perform_deliveries = true
  ActionMailer::Base.default_url_options[:host] = ENV['PROFILES_ACTION_MAILER_HOST']
  ActionMailer::Base.smtp_settings = {
    user_name: ENV['PROFILES_ACTION_MAILER_USERNAME'],
    password:  ENV['PROFILES_ACTION_MAILER_PASSWORD'],
    domain:    ENV['PROFILES_ACTION_MAILER_DOMAIN'],
    address: 'smtp.gmail.com',
    port: 587,
    authentication: 'login',
    enable_starttls_auto: true
  }
else
  ActionMailer::Base.default_url_options = { host: 'localhost', port: '3000' }
end
