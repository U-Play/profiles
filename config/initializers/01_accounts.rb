unless defined?(ACCOUNTS) || Rails.env.test?
  if Rails.env.production?
    file_name = '/home/deploy/config/accounts.yml'
    ACCOUNTS = YAML.load_file(file_name)["profiles"]
  else
    file_name = "#{Rails.root}/config/accounts.yml"
    ACCOUNTS = YAML.load_file(file_name)
  end
end