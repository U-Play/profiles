class ApplicationController < ActionController::Base
  protect_from_forgery

  def after_sign_in_path_for(user)
    if user.profile_finished?
      root_url # TODO mudar para /me
    else
      user_edit_path(user)
    end
  end

end
