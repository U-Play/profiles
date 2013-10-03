class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    oauthorize(:facebook)
  end

  private

  def oauthorize(provider)
    token = request.env['omniauth.params'] ? request.env['omniauth.params']['token'] : nil
    authenticator = Services::OauthAuthenticator.new(request.env['omniauth.auth'], token)
    @user = authenticator.authenticate!

    mixpanel = MixpanelTracker.new(user: @user, env: request.env)
    mixpanel.update_user

    handle_redirect
  end

  private

  def handle_redirect
    if @user.persisted?
      persisted_user_redirect
    else
      new_user_redirect
    end
  end

  def persisted_user_redirect
    set_flash_message :notice, :success if is_navigational_format?
    sign_in_and_redirect @user, event: :authentication
  end

  def new_user_redirect
    session["devise.#{provider}_data"] = request.env['omniauth.auth']
    redirect_to new_user_registration_url
  end

end
