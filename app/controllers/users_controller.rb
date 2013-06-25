class UsersController < ApplicationController

  def view
    @user = Profiles::Users.find params[:id]
  end

end
