class UsersController < ApplicationController

  def view
    @user = User.find params[:id]
  end

  def me
    @user = current_user
    render :view
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user

    if @user.update_attributes(params[:user])
      redirect_to my_profile_path, :notice => t('user.edit.success')
    else
      render :edit 
    end
  end

end
