class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    oauthorize(:facebook)
  end

  private

  def oauthorize(provider)
    authenticator = Services::OauthAuthenticator.new(request.env['omniauth.auth'])
    @user = authenticator.authenticate!
    if @user.persisted?
      set_flash_message :notice, :success, kind: provider if is_navigational_format?
      sign_in_and_redirect @user, event: :authentication
    else
      session["devise.#{provider}_data"] = request.env['omniauth.auth']
      redirect_to new_user_registration_url
    end
  end

end
