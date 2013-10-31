namespace :mixpanel do
  desc "Updates people's properties"
  task :update_people => :environment do
    extend ActionView::Helpers

    print 'Updating people'
    User.with_deleted.each do |user|
      print '.'
      mixpanel = Services::MixpanelTracker.new(user: Presenters::UserPresenter.new(user, self))
      mixpanel.update_user
    end
    print "\n"
  end
end
