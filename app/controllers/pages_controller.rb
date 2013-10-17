class PagesController < ApplicationController

  layout :layout_by_action

  def home
    redirect_to after_sign_in_path_for(current_user) if current_user

    @token = params[:token]
    @users = present Services::FindHighlightedProfiles.new().find
  end

  def about
  end

  def wip
    @user = present User.find(params[:user_id])
  end

  private

  def layout_by_action
    if params[:action] == 'home'
      'simple_landing'
    else
      'simple_about'
    end
  end

end
