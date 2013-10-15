class PagesController < ApplicationController

  layout 'simple'

  def home
    redirect_to after_sign_in_path_for(current_user) if current_user

    @token = params[:token]

    @users = []
    if Rails.env == 'production'
      @users << present(User.find(12))
      @users << present(User.find(16))
      @users << present(User.find(44))
    end
  end

  def about
  end

  def wip
    @user = present User.find(params[:user_id])
  end

end
