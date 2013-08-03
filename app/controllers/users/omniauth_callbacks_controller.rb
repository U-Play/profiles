class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    oauthorize(:facebook)
  end

  private

  def oauthorize(provider)
    token = request.env['omniauth.params'] ? request.env['omniauth.params']['token'] : nil
    authenticator = Services::OauthAuthenticator.new(request.env['omniauth.auth'], token)
    @user = authenticator.authenticate!
    if @user.persisted?
      set_flash_message :notice, :success if is_navigational_format?
      sign_in_and_redirect @user, event: :authentication
    else
      session["devise.#{provider}_data"] = request.env['omniauth.auth']
      redirect_to new_user_registration_url
    end
  end

end
