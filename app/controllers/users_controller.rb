class UsersController < ApplicationController

  layout 'profile'

  def view
    @user = User.find params[:id]
    authorize! :read, @user
  end

  def me
    @user = current_user
    authorize! :me, @user
    render :view
  end

  def edit
    @user = current_user
    authorize! :edit, @user
  end

  def update
    @user = current_user
    authorize! :update, @user

    if @user.update_attributes(params[:user])
      redirect_to my_profile_path, notice: t('user.edit.success')
    else
      render :edit
    end
  end

end
