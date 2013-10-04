class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    if !current_user
      redirect_to root_path, :alert => exception.message
    else
      redirect_to my_profile_path, :alert => exception.message
    end
  end

  def after_sign_in_path_for(user)
    if user.profile_complete?
      my_profile_path
    else
      edit_my_profile_path
    end
  end

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end

  def user_path
    if current_user.username.present?
      username_path(current_user.username)
    else
      profile_path(current_user.id)
    end
  end

  def not_found
    raise ActionController::RoutingError.new
  end
end
