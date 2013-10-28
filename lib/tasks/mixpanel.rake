namespace :mixpanel do
  desc "Updates people's properties"
  task :update_people => :environment do
    print 'Updating people'
    User.with_deleted.each do |user|
      print '.'
      mixpanel = Services::MixpanelTracker.new(user: user)
      mixpanel.update_user
    end
    print "\n"
  end
end
