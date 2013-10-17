class PagesController < ApplicationController

  layout 'simple'

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

end
