unless defined?(ACCOUNTS) || Rails.env.test?
  if Rails.env.production? || Rails.env.staging?
    file_name = '/home/deploy/config/accounts.yml'
  else
    file_name = "#{Rails.root}/config/accounts.yml"
  end

  ACCOUNTS = YAML.load_file(file_name)["profiles"] if File.exists?(file_name)
end
