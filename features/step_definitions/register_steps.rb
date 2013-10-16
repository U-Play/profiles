When(/^someone registers using my referral url$/) do
  visit @user.referral_url
  step "I sign up via facebook"
end

When(/^an existing user registers using my referral url$/) do
  step "I go to the root page"
  step "I sign up via facebook"
  step "I sign out"
  visit @user.referral_url
  step "I sign up via facebook"
end

Then(/^my subscriptions count should not increment$/) do
  @user.referral_subscriptions.should eql @user.reload.referral_subscriptions
end

Then(/^my subscriptions count should increment$/) do
  (@user.referral_subscriptions + 1).should eql @user.reload.referral_subscriptions
end
