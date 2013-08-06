class PagesController < ApplicationController

  def home
    redirect_to user_redirect_path(current_user) if current_user

    @token = params[:token]
  end

end
