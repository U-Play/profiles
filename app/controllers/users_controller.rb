class UsersController < ApplicationController

  def view
    @user = User.find params[:id]
  end

  def me
    @user = current_user
    render :view
  end

  def edit
  end

end
