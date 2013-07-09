class UsersController < ApplicationController

  def view
    @user = Presenters::User.find params[:id]
  end

  def me
    @user = Presenters::User.new current_user
    render :view
  end

  def edit
  end

end
