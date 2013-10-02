class PagesController < ApplicationController

  layout 'simple'

  def home
    redirect_to after_sign_in_path_for(current_user) if current_user

    @token = params[:token]
  end

  def about
  end

  def wip
    @user = User.find(params[:user_id])
  end

end
