class UsersController < ApplicationController

  layout 'profile'

  def view
    @user = User.find params[:id]
    authorize! :read, @user
    set_new_experience
  end

  def view_by_username
    @user = User.find_by_username(params[:username])
    authorize! :read, @user

    if @user
      set_new_experience
      render :view
    else
      not_found
    end
  end

  def me
    authorize! :me, current_user
    flash.keep
    redirect_to user_path
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
    if @user == current_user
      params = flash[:new_experience_params]
      @experience_hide = @user.experiences.any? && params.nil?
      @new_experience = current_user.experiences.build(params)
      @new_experience.tournaments.build
    end
  end

end
