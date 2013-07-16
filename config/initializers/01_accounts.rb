file_name = "#{Rails.root}/config/accounts.yml"

unless Rails.env.test? || !File.exists?(file_name) or defined?(ACCOUNTS)
  ACCOUNTS = YAML.load_file(file_name)[Rails.env]
end