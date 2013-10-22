class UsersUpdateController < ApplicationController
  def edit
    @user = signed_user
    authorize! :edit, @user
  end

  def update
    authorize! :update, signed_user

    @update_user = Services::UpdateUser.new(signed_user, params[:user])
    update_user.subscribe(self)

    update_user.update
  end

  def succeeded
    redirect_to my_profile_path, notice: t('user.edit.success')
  end

  def failed
    @user = present update_user.get_user
    flash.now[:alert] = @user.errors.full_messages.first if @user.errors
    render :edit
  end

  private

  attr_reader :update_user
end
