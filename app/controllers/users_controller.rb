class UsersController < ApplicationController

  def view
    @user = Presenters::User.find params[:id]
  end

end
