class ApplicationController < ActionController::Base
  protect_from_forgery

  def after_sign_in_path_for(user)
    if user.profile_finished?
      my_profile_path
    else
      edit_my_profile_path
    end
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to new_user_session_path, :alert => exception.message
  end

end
