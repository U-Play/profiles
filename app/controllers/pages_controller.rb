class PagesController < ApplicationController

  layout :layout_by_action

  def home
    redirect_to after_sign_in_path_for(current_user) if current_user

    @token = params[:token]

    @users = []
    #NOTE so para teste
    # @users = present User.find(1, 3, 9)
    #NOTE let's hope these users don't delete their accounts :)
    #TODO usar dotenv
    @users = present User.find(12, 16, 44) if Rails.env.production?
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
