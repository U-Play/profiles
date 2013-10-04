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

  def not_found(msg)
    raise ActionController::RoutingError.new(msg)
  end


  def user_path(user)
    if user.username.present?
      username_path(user.username)
    else
      profile_path(user.id)
    end
  end

  def user_url(user)
    root_url + user_path(user)
  end

  helper_method :user_path, :user_url

  def not_found
    raise ActionController::RoutingError.new
  end
end
