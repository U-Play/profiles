class UsersController < ApplicationController

  layout 'profile'

  def view
    @user = User.find params[:id]
    authorize! :read, @user

    if @user == current_user
      set_new_experience
    end
  end

  def me
    authorize! :me, current_user
    flash.keep
    redirect_to profile_path(current_user.id)
  end

  def edit
    @user = current_user
    authorize! :edit, @user
  end

  def update
    @user = current_user
    authorize! :update, @user

    if @user.update_attributes(params[:user].merge(profile_complete: true))
      redirect_to my_profile_path, notice: t('user.edit.success')
    else
      set_user_errors
      render :edit
    end
  end

  private

  def set_user_errors
    flash.now[:alert] = @user.errors.full_messages.first
  end

  def set_new_experience
    params = flash[:new_experience_params]
    @experience_hide = params.nil?
    @new_experience = current_user.experiences.build(params)
    @new_experience.tournaments.build
  end

end
