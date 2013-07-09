class UsersController < ApplicationController

  def view
    #@user = Presenters::User.find params[:id]
    @user = User.find params[:id]
  end

  def me
    @user = current_user
    render :view
  end

end
