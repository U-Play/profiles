class ApplicationController < ActionController::Base
  protect_from_forgery

  def after_sign_in_path_for(user)
    if user.profile_complete?
      my_profile_path
    else
      edit_my_profile_path
    end
  end

  rescue_from CanCan::AccessDenied do |exception|
    if !current_user
      redirect_to root_path, :alert => exception.message
    else
      redirect_to my_profile_path, :alert => exception.message
    end
  end

end
